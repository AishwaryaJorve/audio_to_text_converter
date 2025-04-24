import 'package:cloud_firestore/cloud_firestore.dart';

class TranscriptionModel {
  final String id;
  final String userId;
  final String text;
  final DateTime createdAt;
  final String audioPath;
  final int duration;

  TranscriptionModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.createdAt,
    required this.audioPath,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'text': text,
      'createdAt': createdAt,
      'audioPath': audioPath,
      'duration': duration,
    };
  }

  factory TranscriptionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return TranscriptionModel(
      id: snapshot.id,
      userId: data['userId'],
      text: data['text'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      audioPath: data['audioPath'],
      duration: data['duration'],
    );
  }
} 