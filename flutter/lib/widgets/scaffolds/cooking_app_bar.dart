import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CookingAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget? action = null;

  CookingAppBar({this.action});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppBar(
          iconTheme: const IconThemeData(
            size: 20,
          ),
          actions: [if (action != null) action!],
          title: Image.asset(
            "assets/cooking_logo.png",
            fit: BoxFit.contain,
            height: 50,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
