import 'package:cooking/models/Reward.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/views/rewards/widgets/rewardCard/reward_card.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Rewards extends StatelessWidget {
  static const String routeName = "/rewards";
  late List<Reward> rewards = [];

  @override
  Widget build(BuildContext context) {
    RewardsProvider rewardsProvider = Provider.of<RewardsProvider>(context);
    rewards = rewardsProvider.rewards;

    return RefreshIndicator(
      onRefresh: Provider.of<RewardsProvider>(context).fetchRewards,
      child: rewardsProvider.isLoading
          ? const Loader()
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return RewardCard(reward: rewards[index]);
              },
              itemCount: rewards.length,
            ),
    );
  }
}
