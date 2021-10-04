import 'package:cooking/environment/env.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullPageResults extends StatelessWidget {
  final List<Map<String, dynamic>> filteredUsers;
  final VoidCallback clearTextField;
  final bool addMembersPage;

  FullPageResults(
      {required this.filteredUsers,
      required this.clearTextField,
      this.addMembersPage = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> user = filteredUsers[index];
        return addMembersPage
            ? Card(
                child: CheckboxListTile(
                  value: true,
                  onChanged: (_){},
                  secondary: CircleAvatar(
                    backgroundImage: NetworkImage(serverUrl + user["avatar"]),
                  ),
                  title: Text(user["name"]),
                ),
              )
            : Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile",
                        arguments: user["id"]);
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
      },
    );
  }
}
