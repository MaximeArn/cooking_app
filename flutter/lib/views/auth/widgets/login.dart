import 'package:cooking/utils.dart';
import 'package:cooking/views/auth/widgets/password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onRegisterClicked;
  const LoginWidget({
    Key? key,
    required this.onRegisterClicked,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future logIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(text: e.message);
    }

    Utils.navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/cooking_logo.png",
            height: 150,
          ),
          const SizedBox(height: 20,),
          const Text(
            'Hello \n Welcome back !',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 60,
          ),
          TextFormField(
            autocorrect: false,
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordField(controller : passwordController),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            onPressed: logIn,
            icon: const Icon(Icons.login),
            label: const Text(
              "Log in",
              style: TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Center(child: Text("Forgot Password"),),
              )),
            ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              text: "No account ? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onRegisterClicked,
                  text: "Register",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
