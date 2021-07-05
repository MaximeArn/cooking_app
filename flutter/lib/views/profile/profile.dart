import 'package:cooking/models/User.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return SecondaryScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(user.name),
      ),
    );
  }
}
