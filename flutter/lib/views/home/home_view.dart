import 'package:cooking/views/add_post/add_post_page.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    // index = 3; during dev
    super.initState();
  }

  void setIndex(newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffoldKey: _scaffoldKey,
      index: _currentIndex,
      setIndex: setIndex,
      body: _currentScreen(),
    );
  }

  Widget _currentScreen() {
    switch (_currentIndex) {
      case 0:
        return Feed(
          scaffoldKey: _scaffoldKey,
        );
      case 1:
        return NationalRanking();
      case 2:
        return AddPostPage();
      case 3:
        return Center(
          child: Text("future challenges"),
        );
      case 4:
        return OwnProfile();
      default:
        return Container();
    }
  }
}
