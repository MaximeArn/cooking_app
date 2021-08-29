import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: TabBar(
          indicatorColor:  Theme.of(context).highlightColor, 
          tabs: [
          Tab(
            text: "Nationals",
          ),
          Tab(
            text: "Groups",
          ),
        ]),
      ),
    );
  }
}
