import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Challenge.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetail({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String capitalize(String string) =>
        string[0].toUpperCase() + string.substring(1);

    final List<Widget> posts = challenge.posts.map((post) {
      return Container(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(capitalize("author"), style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            Image.network("$serverUrl/${post.images[0]}"),
          ],
        ),
      );
    }).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
              challenge.theme.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          ...posts,
        ],
      ),
    );
  }
}
