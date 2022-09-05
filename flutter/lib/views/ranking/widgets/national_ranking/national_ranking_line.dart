import 'package:cooking/environment/env.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class NationalRankingLine extends StatelessWidget {
  final Map user;
  final int index;

  NationalRankingLine({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, Profile.routeName,
          arguments: user["id"]),
      leading: (index == 0
          ? Icon(
              Icons.star,
              size: 35,
              color: Color.fromRGBO(255, 215, 0, 1),
            )
          : index == 1
              ? Icon(
                  Icons.star,
                  size: 35,
                  color: Color.fromRGBO(190, 194, 203, 1),
                )
              : index == 2
                  ? Icon(
                      Icons.star,
                      size: 35,
                      color: Color.fromRGBO(184, 115, 51, 1),
                    )
                  : Text(
                      "#${(index + 1).toString()}",
                      style: TextStyle(fontSize: 18),
                    )),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage("$assetsUrl${user["avatar"]}"),
              ),
            ),
            Text(
              user["name"],
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      trailing: Text(
        user["stars"].toString(),
      ),
    );
  }
}
