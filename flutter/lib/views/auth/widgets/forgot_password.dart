import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = "/forgotPassword";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Forgot Password"),
      ),
    );
  }
}
