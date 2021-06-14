import 'package:cooking/data/data.dart';
import 'package:cooking/models/Post.type.dart';
import 'package:cooking/views/vote/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<Feed> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: 
        posts.map(
          (Post post) => PostCard(post: post)
        ).toList()
      ,
    );
  }
}