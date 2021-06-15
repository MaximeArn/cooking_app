import 'package:cooking/models/Reward.type.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Container(
        height: 250,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Expanded(child: Image.asset(reward.image, fit: BoxFit.cover,)),
        ),
      ),
    );
  }
}
