import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String routeName;
  final Icon icon;

  const DrawerItem({required this.title,required this.icon, required this.routeName,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: icon,
              ),
              Text(title),
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(context, routeName));
  }
}
