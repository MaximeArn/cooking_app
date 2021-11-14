import 'package:flutter/material.dart';

class ChallengesSummary extends StatelessWidget {
  List challenges;

  ChallengesSummary({Key? key, required this.challenges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("summary of challenges");
    print(challenges);
    return Column(
      children: challenges.map((challenge) {
        print(challenge);
        return Text(challenge.theme);
      }).toList(),
    );
  }
}
