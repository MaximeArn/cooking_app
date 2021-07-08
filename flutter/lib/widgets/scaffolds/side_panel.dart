import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  const SidePanel();

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
                decoration:
                    BoxDecoration(color: Color.fromRGBO(232, 196, 81, 1)),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 5),
                child: Icon(Icons.home),
              ),
              Text("icon1")
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 5),
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.pushNamed(context, "falseRoute"),
                ),
              ),
              Text("Not Found Page")
            ],
          ),
        ),
      ],
    ));
  }
}
