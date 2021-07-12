import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/editProfile";

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Edit Profile"),
      ),
    );
  }
}
