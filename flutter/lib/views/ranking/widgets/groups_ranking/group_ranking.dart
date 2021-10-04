import 'package:cooking/providers/users.dart';
import 'package:cooking/views/ranking/widgets/groups_ranking/create_group.dart';
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
    void showCreateGroupDialog() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Center(
            child: Text("Enter a name"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              Divider(
                height: 40,
                thickness: 0,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, CreateGroup.routeName);
                      },
                      child: Text("Create")),
                ],
              ),
            ],
          ),
        ),
      );
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
            onPressed: showCreateGroupDialog,
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
