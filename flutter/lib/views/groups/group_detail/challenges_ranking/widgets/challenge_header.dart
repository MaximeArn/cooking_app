import 'package:cooking/environment/env.dart';
import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class ChallengeHeader extends StatelessWidget {
  final Map<String, dynamic>? author;

  ChallengeHeader({
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Profile.routeName,
                arguments: author!["id"]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(assetsUrl + author!["avatar"]),
                ),
              ),
              Text(
                author!["name"],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
