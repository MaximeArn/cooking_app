import 'package:cooking/views/add_post/add_post.dart';
import 'package:cooking/views/nav/widgets/bottom_navigation.dart';
import 'package:cooking/views/nav/widgets/side_panel.dart';
import 'package:cooking/views/profile/profile.dart';
import 'package:cooking/views/ranking/ranking.dart';
import 'package:cooking/views/rewards/rewards.dart';
import 'package:cooking/views/vote/feed.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  void setIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 20,
        ),
        title: RichText(
          text: TextSpan(
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Coo", style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: "K",
                    style: TextStyle(color: Color.fromRGBO(232, 196, 81, 1))),
                TextSpan(text: "ing", style: TextStyle(color: Colors.black)),
              ]),
        ),
      ),
      body: index == 0
          ? Feed()
          : index == 1
              ? Rewards()
              : index == 2
                  ? AddPost()
                  : index == 3
                      ? Ranking()
                      : index == 4
                          ? Profile()
                          : Text("sorry we have a problem"),
      bottomNavigationBar: BottomNavigation(
        setIndex: setIndex,
        index: index,
      ),
      drawer: SidePanel(),
    );
  }
}
