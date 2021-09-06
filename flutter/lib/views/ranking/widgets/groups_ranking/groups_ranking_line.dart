import 'package:cooking/models/Group.dart';
import 'package:flutter/material.dart';

class GroupsRankingLine extends StatelessWidget {
  final Group group;

  GroupsRankingLine({
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(Icons.group),
          title: Text(group.name),
        ),
      ),
    );
  }
}