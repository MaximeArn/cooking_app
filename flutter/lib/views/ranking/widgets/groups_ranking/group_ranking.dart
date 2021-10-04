import 'package:cooking/providers/users.dart';
import 'package:cooking/views/ranking/widgets/groups_ranking/add_group_modal.dart';
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
    showAddGroupModal() {
      return showDialog(
          barrierColor: Color.fromRGBO(0, 0, 0, .7),
          context: context,
          builder: (_) {
            return AddGroupModal();
          });
    }

    final groups = Provider.of<UsersProvider>(context).connectedUser!.groups;

    return Stack(
      children: [
        Container(
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
        ),
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: showAddGroupModal,
            backgroundColor: Theme.of(context).highlightColor,
            child: Icon(
              Icons.add_rounded,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
