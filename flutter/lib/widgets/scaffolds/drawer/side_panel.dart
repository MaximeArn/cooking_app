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
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              const DrawerItem(
                title: "Settings",
                icon: Icon(Icons.settings),
                routeName: "",
              ),
              const DrawerItem(
                title: "Confidentiality",
                icon: Icon(Icons.policy),
                routeName: "",
              ),
              const DrawerItem(
                  title: 'Payements',
                  icon: Icon(Icons.payments),
                  routeName: ""),
              const DrawerItem(
                  title: "Frequently Asked Questions",
                  icon: Icon(Icons.help),
                  routeName: ""),
              const DrawerItem(
                  title: "Legals", icon: Icon(Icons.copyright), routeName: "")
            ],
          ),
        )
      ],
    ));
  }
}
