import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // Sign in using Google
 Future<void> signInWithGoogleAndSaveUserData() async {
  try {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // User canceled the sign-in
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google credentials
    final UserCredential userCredential = await _auth.signInWithCredential(credential);

    // Save user data to Firestore if it's a new user
    if (userCredential.additionalUserInfo!.isNewUser) {
      User? user = userCredential.user;
      if (user != null) {
        String userId = user.uid;
        String email = user.email ?? '';
        String displayName = user.displayName ?? 'Anonymous';
        
        // Example: Saving user data to Firestore
        await _firestore.collection('users').doc(userId).set({
          'userId': userId,
          'email': email,
          'displayName': displayName,
          'createdAt': Timestamp.now(),
        });

        print('User data saved successfully for user: $userId');
      }
    }

    // Navigate to the next screen after successful login
    // Navigator.pushReplacementNamed(context, '/NavBar');
  } catch (e) {
    print('Error signing in with Google: $e');
    // Handle error (show error message, retry logic, etc.)
  }
}

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      throw Exception("Sign out failed: $e");
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
