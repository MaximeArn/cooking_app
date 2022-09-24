import 'package:cooking/environment/env.dart';
import 'package:cooking/themes.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class NationalRankingLine extends StatelessWidget {
  final Map user;
  final int index;

  NationalRankingLine({required this.user, required this.index});

  Widget getRank(int index) {
    return Container(
      padding: EdgeInsets.only(right: 25),
      width: 50,
      child: index == 0
          ? Icon(
              Icons.star,
              size: 35,
              color: CookingTheme.darkTheme.primaryColor,
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
                      textAlign: TextAlign.center,
                    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        Profile.routeName,
        arguments: user["id"],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getRank(index),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          NetworkImage("$assetsUrl${user["avatar"]}"),
                    ),
                  ),
                  Text(
                    user["name"],
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Text(
            user["stars"].toString(),
          ),
        ],
      ),
    );
  }
}
