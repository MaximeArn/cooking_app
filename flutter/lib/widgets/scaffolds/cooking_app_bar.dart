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
        actions: [
          if(action != null)
            action!
        ],
        title: RichText(
          text: TextSpan(
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Coo", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: "K",
                    style: TextStyle(color: Theme.of(context).primaryColor),),
                TextSpan(text: "ing", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}