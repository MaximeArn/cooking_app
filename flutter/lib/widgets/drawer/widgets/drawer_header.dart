import 'package:cooking/environment/env.dart';
import 'package:flutter/material.dart';

class CookingDrawerHeader extends StatefulWidget {
  final String avatar;
  final String name;

  const CookingDrawerHeader(
      {Key? key, required this.avatar, required this.name})
      : super(key: key);

  @override
  State<CookingDrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<CookingDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(assetsUrl + widget.avatar),
            ),
          ),
          Text(
            "Hello ${widget.name}",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
