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

  void deleteAccount({required BuildContext context}) async {
    try {
      final usersProvider = Provider.of<UsersProvider>(context, listen: false);
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null){
        throw FirebaseAuthException(
          message: "you try to delete a user that is not loged",
          code: "delete-null-user",
        );
      }

      await currentUser.delete().then((value) {
        Utils.navigatorKey.currentState!.maybePop();
        usersProvider.connectedUser = null;
      });

      //TODO: Delete the user instance in db and the profile image linked 
      
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "requires-recent-login") {
        Utils.showSnackBar(text: e.message, isError: true);
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton.icon(
                label: Text("Log Out !"),
                icon: Icon(Icons.logout),
                onPressed: () => logOut(context: context),
              ),
              ElevatedButton.icon(
                onPressed: () => deleteAccount(context: context),
                icon: Icon(Icons.delete_forever),
                label: Text("Delete Account !"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
