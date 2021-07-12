import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class PostCardHeader extends StatelessWidget {
  final Map<String, dynamic>? author;

  PostCardHeader({
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Profile.routeName, arguments: author);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(author!["avatar"]),
                ),
              ),
              Text(
                author!["name"],
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
