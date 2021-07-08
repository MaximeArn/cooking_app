import 'package:flutter/material.dart';

class PostCardHeader extends StatelessWidget {
  final String authorAvatar;
  final String author;

  PostCardHeader({required this.authorAvatar, required this.author});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(authorAvatar),
              ),
            ),
            Text(
              author,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
