import 'package:cooking/models/Reward.type.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
      ),
    );
  }
}
