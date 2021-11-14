import 'package:cooking/models/Challenge.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetail({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> posts = challenge.posts.map((post) {
      print(post);
      return Text("widget lol");
    }).toList();
    print("originalPosts :    ${challenge.posts}");
    print("posts :    $posts");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(
            challenge.theme,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          ...posts,
        ],
      ),
    );
  }
}
