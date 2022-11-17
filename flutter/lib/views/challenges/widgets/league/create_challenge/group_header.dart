import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:flutter/material.dart';

class GroupHeader extends StatelessWidget {
  final Group group;

  const GroupHeader({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(assetsUrl + group.avatar),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(group.title as String),
          ),
        ],
      ),
    );
  }
}
