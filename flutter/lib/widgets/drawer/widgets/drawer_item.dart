import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData icon;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  icon,
                  size: 30,
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(context, routeName));
  }
}
