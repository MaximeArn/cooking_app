import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullPageResults extends StatelessWidget {
  late List<User> filteredUsers;

  FullPageResults({required this.filteredUsers});

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
            onTap: () =>
                Navigator.pushNamed(context, "/profile", arguments: user.name),
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
