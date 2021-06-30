import 'package:cooking/views/add_post/add_post.dart';
import 'package:cooking/widgets/bottom_navigation.dart';
import 'package:cooking/widgets/cooking_app_bar.dart';
import 'package:cooking/widgets/main_scaffold.dart';
import 'package:cooking/widgets/side_panel.dart';
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
    return MainScaffold(
      index: index,
      setIndex: setIndex,
      body: index == 0
          ? Feed()
          : index == 1
              ? Rewards()
              : index == 2
                  ? AddPost()
                  : index == 3
                      ? Ranking()
                      : Profile(),
    );
  }
}
