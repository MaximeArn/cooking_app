import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class GroupSettings extends StatelessWidget {
  static const routeName = "/groupSettings";
  const GroupSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text("future settings here"),
        ),
      ),
    );
  }
}
