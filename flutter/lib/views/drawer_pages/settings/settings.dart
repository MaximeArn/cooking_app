import 'package:cooking/utils.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

  void logOut() {
    FirebaseAuth.instance.signOut().then((_) => Utils.navigatorKey.currentState!.maybePop());
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ElevatedButton.icon(
            label: Text("Log Out !"),
            icon: Icon(Icons.logout),
            onPressed: logOut,
          ),
        ),
      ),
    );
  }
}
