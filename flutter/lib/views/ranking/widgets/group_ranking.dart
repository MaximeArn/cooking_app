import 'package:cooking/providers/users.dart';
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
    print("build");
    final groups = Provider.of<UsersProvider>(context).connectedUser!.groups;
    print(groups);
    return Container(
        alignment: Alignment.center,
        child: ListView.separated(
            itemBuilder: (_, int index) => Card(
              child: ListTile(
                leading: Icon(Icons.group),
                title: Text(groups[index].name),
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: groups.length,
        ),);
  }
}