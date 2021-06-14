import 'package:cooking/views/nav/widgets/bottom_navigation.dart';
import 'package:cooking/views/nav/widgets/side_panel.dart';
import 'package:cooking/views/vote/feed.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CooKing")),
      body: Feed(),
      bottomNavigationBar: BottomNavigation(),
      drawer: SidePanel(),
    );
  }
}
