import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FullPageResults extends StatelessWidget {
  late List<User> filteredUsers;
  late VoidCallback clearTextField;

  FullPageResults({required this.filteredUsers, required this.clearTextField});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        User user = filteredUsers[index];
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/profile", arguments: user);
              Provider.of<UsersProvider>(context, listen: false)
                  .getFilteredUsers("");
              clearTextField();
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text(user.name),
          ),
        );
      },
    );
  }
}
