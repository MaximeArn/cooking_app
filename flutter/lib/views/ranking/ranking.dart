import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          children: [
            TabBar(
              indicatorColor:  Theme.of(context).highlightColor, 
              indicatorWeight: 2.5,
              tabs: [
              Tab(
                text: "Nationals",
              ),
              Tab(
                text: "Groups",
              ),
            ],),
            Expanded(
              flex: 1,
              child: TabBarView(children: [
                Text("Nationals"),
                Text("Groups"),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
