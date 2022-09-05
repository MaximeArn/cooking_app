import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CookingAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget? action = null;
  bool hasBottomShadow;

  CookingAppBar({this.action, this.hasBottomShadow = true});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppBar(
          elevation: hasBottomShadow ? 4 : 0,
          iconTheme: const IconThemeData(
            size: 20,
          ),
          actions: [if (action != null) action as Widget],
          title: Image.asset(
            "assets/cooking_logo.png",
            height: 0.95 * preferredSize.height,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
