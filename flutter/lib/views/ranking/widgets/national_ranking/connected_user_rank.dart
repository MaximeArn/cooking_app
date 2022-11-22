import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectedUserRank extends StatelessWidget {
  final User? connectedUser;

  const ConnectedUserRank({Key? key, required this.connectedUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rank = Provider.of<UsersProvider>(context).connectedUserRank;
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 6),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "#$rank",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage("$assetsUrl${connectedUser!.avatar}"),
            ),
          ),
          Text(
            "Vous",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
