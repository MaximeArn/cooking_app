import 'package:cooking/models/Challenge.dart';
import 'package:cooking/views/groups/group_detail/challenges_ranking/widgets/challenge_post.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetail({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> posts = challenge.posts.map((post) {
      return ChallengePost(post: post);
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
