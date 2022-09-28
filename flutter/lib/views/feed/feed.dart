// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

import 'package:cooking/models/Post.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/views/feed/widgets/post_video_item.dart';
import 'package:cooking/views/feed/widgets/transparent_app_bar.dart';
import 'package:cooking/widgets/loader.dart';

class Feed extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Feed({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  static const String routeName = '/feed';

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _currentIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    List<Post> posts = _getCurrentList(postsProvider);
    Widget w;
    if (posts.isEmpty) {
      w = _emptyList();
    } else {
      // todo remove this
      int i = 0;
      posts.forEach((element) {
        element.videoUrl = i.isEven
            ? "https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4"
            : "https://assets.mixkit.co/videos/preview/mixkit-woman-running-above-the-camera-on-a-running-track-32807-large.mp4";
        i++;
      });
      w = _videosScrolling(posts);
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          RefreshIndicator(
              onRefresh:
                  Provider.of<PostsProvider>(context, listen: false).fetchPosts,
              child: postsProvider.isLoading ? Loader() : w),
          TransparentAppBar(
            currentTabIndex: _currentIndexTab,
            onTabPressed: _onTabPressed,
            onDrawerPressed: _onDrawerPressed,
            onSearchPressed: _onSearchPressed,
          )
        ],
      ),
    );
  }

  //////////////////////////////// WIDGETS ////////////////////////////////

  Widget _videosScrolling(List<Post> posts) => PreloadPageView.builder(
        itemCount: posts.length,
        scrollDirection: Axis.vertical,
        preloadPagesCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return PostVideoItem(post: posts[index]);
        },
      );

  Widget _emptyList() => Center(child: Text("(vide)"));

  //////////////////////////////// LISTENERS ////////////////////////////////

  void _onTabPressed(int index) {
    setState(() {
      _currentIndexTab = index;
    });
  }

  void _onDrawerPressed() {
    widget.scaffoldKey.currentState?.openDrawer();
  }

  void _onSearchPressed() {
    //todo
  }

  //////////////////////////////// FUNCTIONS ////////////////////////////////

  List<Post> _getCurrentList(PostsProvider postsProvider) {
    List<Post> currentList =
        _currentIndexTab == 0 ? postsProvider.posts : <Post>[];
    return currentList;
  }
}
