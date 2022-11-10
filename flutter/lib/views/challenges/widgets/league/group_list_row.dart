import 'package:cooking/environment/env.dart';
import 'package:flutter/material.dart';

class GroupListRow extends StatelessWidget {
  const GroupListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String avatar = "default_avatar.jpg";
    final String title = "Group Title";

    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(assetsUrl + avatar),
                  radius: 32,
                ),
                Text(title)
              ],
            ),
          ),
          Column(
            children: [
              Text("Challenge"),
              Text("Archive"),
            ],
          )
        ],
      ),
    );
  }
}
