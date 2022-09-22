import 'package:cooking/providers/users.dart';
import 'package:cooking/widgets/drawer/widgets/drawer_header.dart';
import 'package:cooking/widgets/drawer/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/drawer_pages/settings/settings.dart';

class CookingDrawer extends StatelessWidget {
  const CookingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectedUser = Provider.of<UsersProvider>(context).connectedUser;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 60, right: 20),
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
            ),
            Column(
              children: [
                CookingDrawerHeader(
                    avatar: connectedUser!.avatar, name: connectedUser.name),
                Expanded(
                  child: ListView(
                    children: [
                      const DrawerItem(
                        title: "ChatBox",
                        icon: Icons.chat_bubble_outline,
                        routeName: "",
                      ),
                      const DrawerItem(
                        title: "Settings",
                        icon: Icons.settings_outlined,
                        routeName: Settings.routeName,
                      ),
                      const DrawerItem(
                        title: "Confidentiality",
                        icon: Icons.shield_outlined,
                        routeName: "",
                      ),
                      const DrawerItem(
                        title: 'Payements',
                        icon: Icons.credit_card_outlined,
                        routeName: "",
                      ),
                      const DrawerItem(
                        title: "Advantages",
                        icon: Icons.confirmation_num_outlined,
                        routeName: "",
                      ),
                      const DrawerItem(
                          title: "Frequently Asked Questions",
                          icon: Icons.help_outline_outlined,
                          routeName: ""),
                      const DrawerItem(
                        title: "Legals",
                        icon: Icons.error_outline,
                        routeName: "",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Log out",
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
