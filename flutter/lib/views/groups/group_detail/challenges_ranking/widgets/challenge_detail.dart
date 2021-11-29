import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Challenge.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetail({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> posts = challenge.posts.map((post) {
      return Container(
        height: 300,
        child: Column(
          children: [
            Text("author", textAlign: TextAlign.start,),
            Image.network("$serverUrl/${post.images[0]}"),
          ],
        ),
      );
    }).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
              challenge.theme,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
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
