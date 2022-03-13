import 'package:cooking/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  void comparePasswords({
    required String password,
    required String confirmPassword,
  }) {
    final bool isIdentical = password == confirmPassword;
    if (!isIdentical) {
      throw FirebaseAuthException(
        code: "different_passwords",
        message: "Passwords must be identical",
      );
    }
  }

  void register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      comparePasswords(password: password, confirmPassword: confirmPassword);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
      rethrow;
    }
  }
}
