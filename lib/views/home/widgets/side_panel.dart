import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DrawerHeader(
                child: Center(child: Text("Menu")),
                decoration: BoxDecoration(color: Colors.yellow),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, bottom: 30, top: 30),
          child: Row(
            children: [Icon(Icons.supervised_user_circle), Text("Profile")],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Row(
            children: [Icon(Icons.subway_rounded), Text("subway")],
          ),
        )
      ],
    ));
  }
}
