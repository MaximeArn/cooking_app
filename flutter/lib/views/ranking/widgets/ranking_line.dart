import 'package:cooking/models/User.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class RankingLine extends StatelessWidget {
  final User user;
  final int index;

  RankingLine({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, Profile.routeName,
            arguments: user.id),
        leading: Icon(Icons.star),
        title: Text(user.name),
        trailing: Text(
          user.stars.toString(),
        ),
      ),
    );
  }
}
