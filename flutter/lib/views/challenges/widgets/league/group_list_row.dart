import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:cooking/views/challenges/widgets/league/create_challenge/create_challenge.dart';
import 'package:flutter/material.dart';

class GroupListRow extends StatelessWidget {
  final Group group;

  const GroupListRow({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.7),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(assetsUrl + group.avatar),
                  radius: 30,
                ),
              ),
              Text(group.title as String,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(CreateChallenge.routeName, arguments: group),
                child: Text(
                  "Challenge",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              SizedBox(
                width: 75,
                child: Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(CreateChallenge.routeName, arguments: group),
                child: Text(
                  "Archives",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
