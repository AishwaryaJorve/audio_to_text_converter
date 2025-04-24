import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<User?> signInWithGoogle() async {
    try {
      print('Starting Google Sign-In process');
      
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      print('Google User: $googleUser');
      
      if (googleUser == null) {
        print('Google Sign-In was cancelled');
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      
      print('Google Auth obtained');

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('Credential created');

      // Sign in to Firebase with the credential
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      print('Firebase User: $user');

      if (user != null) {
        // Check if user already exists in Firestore
        await _createUserInFirestore(user);
      }
      
      return user;
    } catch (error) {
      print('Detailed Google Sign-In Error: $error');
      return null;
    }
  }

  static Future<void> _createUserInFirestore(User user) async {
    try {
      // Check if user document already exists
      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        // Create a new user document in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
        });
      } else {
        // Update last login time
        await _firestore.collection('users').doc(user.uid).update({
          'lastLogin': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      print('Error creating/updating user in Firestore: $e');
    }
  }

  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (error) {
      print('Sign Out Error: $error');
    }
  }

  // Check if user is currently signed in
  static User? getCurrentUser() {
    return _auth.currentUser;
  }
} 