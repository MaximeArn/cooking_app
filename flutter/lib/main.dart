import 'package:cooking/providers/posts.dart';
import 'package:cooking/providers/rewards.dart';
import 'package:cooking/views/nav/home.dart';
import 'package:cooking/views/reward_detail.dart';
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
        routes: {
          '/': (_) => Home(),
          RewardDetail.routeName: (_) => RewardDetail(),
        },
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
