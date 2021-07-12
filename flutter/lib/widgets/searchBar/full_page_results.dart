import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullPageResults extends StatelessWidget {
  final List<Map<String, dynamic>> filteredUsers;
  final VoidCallback clearTextField;

  FullPageResults({required this.filteredUsers, required this.clearTextField});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> user = filteredUsers[index];
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/profile", arguments: user["id"]);
              Provider.of<UsersProvider>(context, listen: false)
                  .getFilteredUsers("");
              clearTextField();
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user["avatar"]),
            ),
            title: Text(user["name"]),
          ),
        );
      },
    );
  }
}
