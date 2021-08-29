import 'package:cooking/views/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';

class CookingAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isOwnProfile;

  const CookingAppBar({required this.isOwnProfile});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppBar(
        iconTheme: const IconThemeData(
          size: 20,
        ),
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     icon: Icon(Icons.cloud_outlined),
        //   ),
        //   Tab(
        //     icon: Icon(Icons.beach_access_sharp),
        //   ),
        //   Tab(
        //     icon: Icon(Icons.brightness_5_sharp),
        //   ),
        // ]),
        actions: [
          if (isOwnProfile)
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, EditProfile.routeName),
              icon: Icon(Icons.edit),
            ),
        ],
        title: RichText(
          text: const TextSpan(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
