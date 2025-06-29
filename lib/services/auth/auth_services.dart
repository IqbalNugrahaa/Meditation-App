import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/response/auth/auth_failure.dart';

part 'auth_services.g.dart';

@riverpod
AuthServices authServices(Ref ref) => AuthServices();

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();

  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw AuthFailure(message: 'User creation failed.');
      }

      await FirebaseFirestore.instance
          .collection('accounts')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName,
        'filename': user.photoURL,
        'topic': null,
        'meditations': [],
        'created_at': Timestamp.now(),
        'updated_at': Timestamp.now(),
      });

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(message: _mapFirebaseError(e.code));
    } catch (e) {
      throw AuthFailure(message: 'Unexpected error occurred.');
    }
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(message: _mapFirebaseError(e.code));
    } catch (e) {
      throw AuthFailure(message: 'Unexpected error occurred.');
    }
  }

  Future<User?> authWithGoogle() async {
    final googleUser = await _google.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _google.signOut();
    await _auth.signOut();
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Account not found.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'weak-password':
        return 'Password is too weak.';
      default:
        return 'An error occurred. Code: $code';
    }
  }
}
