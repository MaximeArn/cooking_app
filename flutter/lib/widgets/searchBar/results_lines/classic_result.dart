import 'package:cooking/environment/env.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassicResult extends StatelessWidget {
  final user;
  final clearTextField;

  const ClassicResult({Key? key, required this.user, required this.clearTextField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/profile", arguments: user["id"]);
          Provider.of<UsersProvider>(context, listen: false)
              .getFilteredUsers("");
          clearTextField();
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(serverUrl + user["avatar"]),
        ),
        title: Text(user["name"]),
      ),
    );
  }
}
