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
                    Table(
                      border: TableBorder.all(width: 1, color: Colors.black),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Rank"),
                              ),
                            ),TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Name"),
                              ),
                            ),TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Points"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
