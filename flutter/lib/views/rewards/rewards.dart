import 'package:cooking/models/Reward.type.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/views/rewards/widgets/rewardCard/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Rewards extends StatelessWidget {
  List<Reward> rewards = [];

  @override
  Widget build(BuildContext context) {
    rewards = Provider.of<RewardsProvider>(context).rewards;
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return RewardCard(reward: rewards[index]);
      },
      itemCount: rewards.length,
    );
  }
}
