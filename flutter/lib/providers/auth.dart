import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  void comparePasswords({
    required String password,
    required String confirmPassword,
  }) {
    final bool isIdentical = password == confirmPassword;
    if (!isIdentical) {
      throw firebase.FirebaseAuthException(
        code: "different_passwords",
        message: "Passwords must be identical",
      );
    }
  }

  Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    Utils.showLoader();
    try {
      final usersProvider = Provider.of<UsersProvider>(context, listen: false);

      comparePasswords(password: password, confirmPassword: confirmPassword);

      await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      http.Response res = await http.post(
        Uri.parse(
          "$serverUrl/users",
        ),
        headers: {'Content-type': 'application/json'},
        //TODO: add a field in the form to get the name that is required to create a new user
        body: json
            .encode({"email": email, "password": password, "name": "Maxime"}),
      );

      usersProvider.connectedUser = User.fromJson(json.decode(res.body));
      Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on firebase.FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
      Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
      rethrow;
    }
  }

  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final usersProvider = Provider.of<UsersProvider>(context, listen: false);
      Utils.showLoader();

      await firebase.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      http.Response response = await http.get(Uri.parse(
        "$serverUrl/users/email/$email",
      ));
      usersProvider.connectedUser = User.fromJson(json.decode(response.body), isPopulated: true);

      Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);

    } on firebase.FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
      Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
      rethrow;
    }
  }
}
