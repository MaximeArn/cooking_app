import 'package:cooking/models/Post.type.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(post.description),
    );
  }
}
