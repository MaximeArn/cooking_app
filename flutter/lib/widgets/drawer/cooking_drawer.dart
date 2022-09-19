import 'package:cooking/widgets/drawer/widgets/drawer_header.dart';
import 'package:cooking/widgets/drawer/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

import '../../views/drawer_pages/settings/settings.dart';

class CookingDrawer extends StatelessWidget {
  const CookingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        CookingDrawerHeader(),
        Expanded(
          flex: 20,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                const DrawerItem(
                  title: "Settings",
                  icon: Icon(Icons.settings),
                  routeName: Settings.routeName,
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
                  title: "Legals",
                  icon: Icon(Icons.copyright),
                  routeName: "",
                ),
                const DrawerItem(
                  title: "Legals",
                  icon: Icon(Icons.copyright),
                  routeName: "",
                ),
                const DrawerItem(
                  title: "Legals",
                  icon: Icon(Icons.copyright),
                  routeName: "",
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
