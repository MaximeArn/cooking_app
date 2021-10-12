import 'package:cooking/models/Group.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class GroupDetail extends StatelessWidget {
  static const routeName = "/groupDetail";
  const GroupDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;

    return SecondaryScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(group.name as String),
      ),
    );
  }
}
