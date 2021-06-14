import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final void Function(int) setIndex;

  BottomNavigation({required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.yellow,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.touch_app,
          ),
          label: "vote",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: "rewards"),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "post"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "ranking"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "profile"),
      ],
      onTap: (newIndex) {
        setIndex(newIndex);
      },
    );
  }
}
