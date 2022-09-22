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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Icon(
                          icon,
                          size: 38,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              height: 35,
              thickness: .15,
              color: Colors.black,
            ),
          )
        ],
      ),
      onTap: () => Navigator.pushNamed(context, routeName),
    );
  }
}
