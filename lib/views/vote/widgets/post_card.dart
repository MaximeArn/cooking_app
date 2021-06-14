import 'package:cooking/models/Post.type.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Flexible(
                flex:1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(post.authorAvatar),
                    ),
                    Text(post.author)
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  children: [],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
