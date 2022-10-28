import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class GroupsList extends StatelessWidget {
  static String routeName = "/groupsList";
  const GroupsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Center(
        child: Text("groups List"),
      ),
    );
  }
}
