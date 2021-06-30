import 'package:flutter/material.dart';

class CookingAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        size: 20,
      ),
      title: RichText(
        text: TextSpan(
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "Coo", style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: "K",
                  style: TextStyle(color: Color.fromRGBO(232, 196, 81, 1))),
              TextSpan(text: "ing", style: TextStyle(color: Colors.black)),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
