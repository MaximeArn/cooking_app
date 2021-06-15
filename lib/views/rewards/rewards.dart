import 'package:cooking/data/rewards.dart';
import 'package:cooking/models/Reward.type.dart';
import 'package:cooking/views/rewards/widgets/rewardCard.dart';
import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  late List<Reward> rewards;

  @override
  void initState() {
    rewards = rewardsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return RewardCard(reward: rewards[index]);
      },
      itemCount: rewards.length,
    );
  }
}
