import 'package:cooking/views/challenges/widgets/league/create_challenge/group_header.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class CreateChallenge extends StatelessWidget {
  static const routeName = "/createChallenge";
  const CreateChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final group = ModalRoute.of(context)!.settings.arguments;
    print(group);
    return SecondaryScaffold(
        body: Column(
      children: [
        GroupHeader(group: group),
        Text("Challenge"),
      ],
    ));
  }
}
