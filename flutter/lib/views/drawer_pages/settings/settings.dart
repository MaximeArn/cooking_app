import 'package:cooking/providers/users.dart';
import 'package:cooking/utils.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

  void logOut({required BuildContext context}) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    FirebaseAuth.instance.signOut().then((_) {
      Utils.navigatorKey.currentState!.maybePop();
      usersProvider.connectedUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ElevatedButton.icon(
            label: Text("Log Out !"),
            icon: Icon(Icons.logout),
            onPressed: () => logOut(context: context),
          ),
        ),
      ),
    );
  }
}
