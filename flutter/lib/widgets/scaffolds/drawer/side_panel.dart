import 'package:cooking/widgets/scaffolds/drawer/widgets/drawer_item.dart';
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
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
                const DrawerItem(title: "Settings", icon: Icon(Icons.settings), routeName: "",),
                const DrawerItem(title: "Confidentialité", icon: Icon(Icons.policy), routeName: "",),
                const DrawerItem(title: 'Payements', icon: Icon(Icons.payments), routeName: ""),
                const DrawerItem(title: "Frequently asked questions", icon: Icon(Icons.help), routeName: "")
            ],
            
          ),
        )
      ],
    ));
  }
}
