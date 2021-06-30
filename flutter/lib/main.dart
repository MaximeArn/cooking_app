import 'package:cooking/models/Reward.type.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/views/RewardDetail/reward_detail.dart';
import 'package:cooking/views/home/home_view.dart';
import 'package:cooking/views/not_found/not_found.dart';
import 'package:cooking/views/feed/feed.dart';
import 'package:cooking/views/rewards/rewards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Cooking());
}

class Cooking extends StatefulWidget {
  @override
  _CookingState createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
  final RewardsProvider rewardsProvider = RewardsProvider();
  final PostsProvider postsProvider = PostsProvider();

  @override
  void initState() {
    rewardsProvider.fetchRewards();
    postsProvider.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: rewardsProvider),
        ChangeNotifierProvider.value(value: postsProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "homepage",
        home: HomeView(),
        onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => NotFound()),
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
