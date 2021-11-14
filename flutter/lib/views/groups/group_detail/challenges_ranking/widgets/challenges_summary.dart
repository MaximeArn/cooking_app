import 'package:cooking/views/groups/group_detail/challenges_ranking/widgets/challenge_detail.dart';
import 'package:flutter/material.dart';

class ChallengesSummary extends StatelessWidget {
  final List challenges;

  ChallengesSummary({Key? key, required this.challenges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("summary of challenges");
    print(challenges);
    return Column(
      children: challenges.map((challenge) {
        return ChallengeDetail(challenge: challenge);
      }).toList(),
    );
  }
}
