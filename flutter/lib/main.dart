import 'package:cooking/providers/rewards.dart';
import 'package:cooking/views/nav/home.dart';
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

  @override
  void initState() {
    rewardsProvider.fetchRewards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: rewardsProvider)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "homepage",
        home: Home(),
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
