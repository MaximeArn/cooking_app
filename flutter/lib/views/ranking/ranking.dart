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
              unselectedLabelColor: Colors.black54,
              labelColor: Theme.of(context).highlightColor,
              indicatorColor: Theme.of(context).highlightColor,
              indicatorWeight: 2.5,
              tabs: [
                Tab(
                  text: "National",
                ),
                Tab(
                  text: "Groups",
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Nationals",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Groups"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
