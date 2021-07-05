import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ResultsList extends StatelessWidget {
  late List<User> filteredUsers;
  late VoidCallback clearTextField;

  ResultsList({required this.filteredUsers, required this.clearTextField});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(232, 196, 81, .7),
      child: Column(
        children: [
          ...filteredUsers.take(3).map(
                (user) => Card(
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
                ),
              ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, "/searchPage");
              },
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
