import 'package:cooking/providers/users.dart';
import 'package:cooking/views/ranking/widgets/groups_ranking/groups_ranking_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupRanking extends StatefulWidget {
  const GroupRanking({Key? key}) : super(key: key);

  @override
  _GroupRankingState createState() => _GroupRankingState();
}

class _GroupRankingState extends State<GroupRanking> {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<UsersProvider>(context).connectedUser!.groups;
    print(groups);
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: ListView.builder(
          itemBuilder: (_, int index) =>
              GroupsRankingLine(group: groups[index]),
          itemCount: groups.length,
        ),
      ),
    );
  }
}
