import 'package:cooking/views/groups/group_detail/challenges_ranking/widgets/challenge_detail.dart';
import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  final List challenges;

  Challenges({Key? key, required this.challenges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: challenges.map((challenge) {
        return ChallengeDetail(challenge: challenge);
      }).toList(),
    );
  }
}
