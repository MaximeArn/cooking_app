import 'package:cooking/models/Group.dart';
import 'package:cooking/providers/groups.dart';
import 'package:cooking/views/groups/group_detail/challenges_ranking/widgets/challenges_summary.dart';
import 'package:cooking/views/groups/group_detail/challenges_ranking/widgets/ranking_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengesRanking extends StatelessWidget {
  final Group group;

  const ChallengesRanking({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getGroup =
        Provider.of<GroupsProvider>(context, listen: false).getGroupById;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      alignment: Alignment.center,
      child: FutureBuilder(
        future: getGroup(groupId: group.id as String),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Text("error : ${snapshot.error}")
              : ListView(
                  children: [
                    RankingTable(),
                    ChallengesSummary(
                        challenges: (snapshot.data as Group).challenges)
                  ],
                );
        },
      ),
    );
  }
}
