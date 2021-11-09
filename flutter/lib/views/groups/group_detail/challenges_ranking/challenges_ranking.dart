import 'package:cooking/models/Group.dart';
import 'package:cooking/providers/groups.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengesRanking extends StatelessWidget {
  final Group group;

  const ChallengesRanking({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getGroup =
        Provider.of<GroupsProvider>(context, listen: false).getGroupById;
    print(group.id.runtimeType);
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: getGroup(groupId: group.id as String),
            builder: (context, snapshot) {
              return snapshot.hasError ? Text("error : ${snapshot.error}") : Text("great !");
            }));
  }
}
