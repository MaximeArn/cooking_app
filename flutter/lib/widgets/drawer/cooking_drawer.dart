import 'package:cooking/widgets/drawer/widgets/drawer_header.dart';
import 'package:cooking/widgets/drawer/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

import '../../views/drawer_pages/settings/settings.dart';

class CookingDrawer extends StatelessWidget {
  const CookingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
          child: Column(
        children: [
          CookingDrawerHeader(),
          Expanded(
            child: ListView(
              children: [
                const DrawerItem(
                  title: "Settings",
                  icon: Icons.settings,
                  routeName: Settings.routeName,
                ),
                const DrawerItem(
                  title: "Confidentiality",
                  icon: Icons.policy,
                  routeName: "",
                ),
                const DrawerItem(
                    title: 'Payements', icon: Icons.payments, routeName: ""),
                const DrawerItem(
                    title: "Frequently Asked Questions",
                    icon: Icons.help,
                    routeName: ""),
                const DrawerItem(
                  title: "Legals",
                  icon: Icons.copyright,
                  routeName: "",
                ),
                const DrawerItem(
                  title: "Legals",
                  icon: Icons.copyright,
                  routeName: "",
                ),
                const DrawerItem(
                  title: "ChatBox",
                  icon: Icons.copyright,
                  routeName: "",
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
