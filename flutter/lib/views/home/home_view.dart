import 'package:cooking/views/add_post/add_post.dart';
import 'package:cooking/views/feed/feed.dart';
import 'package:cooking/views/profiles/own_profile/own_profile.dart';
import 'package:cooking/views/ranking/ranking.dart';
import 'package:cooking/widgets/scaffolds/main_scaffold.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              ? Ranking()
              : index == 2
                  ? Center(
                      child: Text("Add Post"),
                    )
                  // ? AddPost()
                  : index == 3
                      ? Center(
                          child: Text("future challenges"),
                        )
                      // ? Ranking()
                      : OwnProfile(),
    );
  }
}
