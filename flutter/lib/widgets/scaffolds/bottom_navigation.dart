import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final void Function(int) setIndex;
  final int index;

  const BottomNavigation({required this.setIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          label: "Vote",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events), label: "Ranking"),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Post"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_alt), label: "Challenge"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Profile"),
      ],
      onTap: (newIndex) {
        setIndex(newIndex);
      },
    );
  }
}
