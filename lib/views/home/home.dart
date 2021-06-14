import 'package:cooking/views/home/widgets/bottom_navigation.dart';
import 'package:cooking/views/home/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CooKing")),
      body: Container(
          alignment: Alignment.center,
          child: Text("home")
      ),
      bottomNavigationBar: BottomNavigation(),
      drawer: SidePanel(),
    );
  }
}
