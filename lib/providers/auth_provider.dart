import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// TODO: Firebase Auth will be implemented later using Bloc

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // // sign up with email and password
  // Future<AuthResult> signUp(String email, String password) async {
  //   try {
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     return result;
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  // // logout
  // Future<void> logOut() async {
  //   try {
  //     await _auth.signOut();
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  // // forgot password
  // Future<void> forgotPassword(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  // // verify email
  // Future<void> verifyEmail() async {
  //   FirebaseUser user = await _auth.currentUser();
  //   user.sendEmailVerification();
  // }
}
