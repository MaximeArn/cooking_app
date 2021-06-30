import 'package:cooking/models/Post.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  static const String routeName = '/feed';

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    List<Post> posts = postsProvider.posts;

    return RefreshIndicator(
      onRefresh: Provider.of<PostsProvider>(context).fetchPosts,
      child: postsProvider.isLoading ? Loader() :  ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: posts.length,
        itemBuilder: (context, index) => PostCard(post: posts[index]),
        separatorBuilder: (context, index) => Divider(
          height: 25,
        ),
      ),
    );
  }
}
