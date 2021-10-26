import 'package:cooking/models/Group.dart';
import 'package:cooking/views/groups/group_detail/group_detail.dart';
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
        elevation: 3,
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, GroupDetail.routeName, arguments: group),
          leading: Icon(Icons.group),
          title: Text(group.name as String),
        ),
      ),
    );
  }
}