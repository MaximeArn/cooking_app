import 'package:cooking/models/User.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';

class ResultsList extends StatelessWidget {
  late List<User> filteredUsers;

  ResultsList({required this.filteredUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(232, 196, 81, .7),
      child: Column(
        children: [
          ...filteredUsers.take(4).map(
                (user) => Card(
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/profile",
                        arguments: user.name),
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
