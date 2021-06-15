import 'package:cooking/models/Reward.type.dart';
import 'package:cooking/views/rewards/widgets/rewardCard/reward_card_image.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 5,
        child: Container(
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [RewardCardImage(image: reward.image)],
          ),
        ),
      ),
    );
  }
}
