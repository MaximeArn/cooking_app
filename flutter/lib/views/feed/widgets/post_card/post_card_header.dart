import 'package:cooking/views/profile/profile.dart';
import 'package:flutter/material.dart';

class PostCardHeader extends StatelessWidget {
  final String authorAvatar;
  final String author;
  final String authorId;

  PostCardHeader(
      {required this.authorAvatar,
      required this.author,
      required this.authorId,});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Profile.routeName,
                arguments: authorId);
          },
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
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
