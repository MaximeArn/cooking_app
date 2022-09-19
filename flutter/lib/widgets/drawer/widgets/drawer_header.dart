import 'package:flutter/material.dart';

class CookingDrawerHeader extends StatefulWidget {
  const CookingDrawerHeader({Key? key}) : super(key: key);

  @override
  State<CookingDrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<CookingDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: DrawerHeader(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://cooking-api-assets.s3.eu-west-3.amazonaws.com/profile_photo_1.jpg",
                ),
              ),
            ),
            Text(
              "Hello Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
