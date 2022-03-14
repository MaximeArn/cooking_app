import 'dart:convert';

import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart' as UserModel;
import 'package:cooking/providers/users.dart';
import 'package:cooking/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      throw FirebaseAuthException(
        code: "different_passwords",
        message: "Passwords must be identical",
      );
    }
  }

  void register(
      {required String email,
      required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    Utils.showLoader();
    try {
      comparePasswords(password: password, confirmPassword: confirmPassword);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      //TODO: store the user returned from the back in the "connectedUser" property
      final user = json.decode(res.body);
      print(user);

      Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
      rethrow;
    }
  }
}
