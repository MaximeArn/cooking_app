import 'package:cooking/models/Post.type.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = Provider.of<PostsProvider>(context).posts;

    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(post: posts[index]),
      separatorBuilder: (context, index) => Divider(
        height: 25,
      ),
    );
  }
}
