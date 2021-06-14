import 'package:flutter/material.dart';

class PostCardFooter extends StatelessWidget {
  final int vote;

  PostCardFooter({required this.vote});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Vote : ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            child: IconButton(
                onPressed: () {
                  print("1 star");
                },
                icon: Icon(Icons.star_border)),
          ),
          IconButton(
              onPressed: () {
                print("2 star");
              },
              icon: Icon(Icons.star_border)),
          IconButton(
              onPressed: () {
                print("3 star");
              },
              icon: Icon(Icons.star_border)),
        ],
      ),
    );
  }
}
