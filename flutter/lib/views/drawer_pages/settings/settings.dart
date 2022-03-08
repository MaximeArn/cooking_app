import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(body:Center(child: Text("settings"),));
  }
}
