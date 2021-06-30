import 'package:cooking/models/Post.type.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card.dart';
import 'package:cooking/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  static const String routeName = '/feed';

  @override
  Widget build(BuildContext context) {
    List<Post> posts = Provider.of<PostsProvider>(context).posts;

    return MainScaffold(
      body: RefreshIndicator(
        onRefresh: Provider.of<PostsProvider>(context).fetchPosts,
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: posts.length,
          itemBuilder: (context, index) => PostCard(post: posts[index]),
          separatorBuilder: (context, index) => Divider(
            height: 25,
          ),
        ),
      ),
    );
  }
}
