import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        child: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.cloud_outlined),
          ),
          Tab(
            icon: Icon(Icons.beach_access_sharp),
          ),
          Tab(
            icon: Icon(Icons.brightness_5_sharp),
          ),
        ]),
      ),
    );
  }
}
