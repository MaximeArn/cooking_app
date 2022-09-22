import 'package:flutter/material.dart';

class CookingDrawerHeader extends StatefulWidget {
  const CookingDrawerHeader({Key? key}) : super(key: key);

  @override
  State<CookingDrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<CookingDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70, bottom: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://cooking-api-assets.s3.eu-west-3.amazonaws.com/profile_photo_1.jpg",
              ),
            ),
          ),
          Text(
            "Hello Name",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
