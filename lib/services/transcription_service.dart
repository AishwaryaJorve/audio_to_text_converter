import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../models/transcription_model.dart';

class TranscriptionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTranscription({
    required String text,
    required String audioPath,
    required int duration,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    try {
      final transcription = TranscriptionModel(
        id: '', // Firestore will generate the ID
        userId: user.uid,
        text: text,
        createdAt: DateTime.now(),
        audioPath: audioPath,
        duration: duration,
      );

      // Add retry mechanism
      await _retryOperation(() async {
        await _firestore
            .collection('transcriptions')
            .add(transcription.toMap());
      });
    } on FirebaseException catch (e) {
      print('Firestore Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }

  // Retry mechanism for transient errors
  Future<T> _retryOperation<T>(Future<T> Function() operation, {int maxAttempts = 3}) async {
    int attempts = 0;
    while (true) {
      try {
        return await operation();
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;
        
        // Exponential backoff
        await Future.delayed(Duration(seconds: attempts * 2));
      }
    }
  }

  Stream<List<TranscriptionModel>> getUserTranscriptions() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.value([]);
    }

    return _firestore
        .collection('transcriptions')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TranscriptionModel.fromFirestore(doc, null))
            .toList())
        .handleError((error) {
      print('Error fetching transcriptions: $error');
      return <TranscriptionModel>[];
    });
  }

  Future<void> deleteTranscription(String transcriptionId) async {
    try {
      await _retryOperation(() async {
        await _firestore.collection('transcriptions').doc(transcriptionId).delete();
      });
    } catch (e) {
      print('Error deleting transcription: $e');
      rethrow;
    }
  }
} 