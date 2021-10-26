import 'package:cooking/models/Group.dart';
import 'package:flutter/material.dart';

class ChallengesRanking extends StatelessWidget {
  final Group group;

  const ChallengesRanking({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(group.members.length);
    return Container(
      alignment: Alignment.center,
      child: Text("Challenges Ranking ${group.members.length}"),
    );
  }
}
