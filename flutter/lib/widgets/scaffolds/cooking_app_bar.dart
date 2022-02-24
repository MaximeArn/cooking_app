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
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 20,
        ),
        actions: [
          if(action != null)
            action!
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