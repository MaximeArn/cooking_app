import 'package:cooking/views/nav/widgets/bottom_navigation.dart';
import 'package:cooking/views/nav/widgets/side_panel.dart';
import 'package:cooking/views/vote/feed.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 20,),
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
      body: Feed(),
      bottomNavigationBar: BottomNavigation(),
      drawer: SidePanel(),
    );
  }
}
