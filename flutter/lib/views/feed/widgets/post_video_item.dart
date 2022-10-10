// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_video_player/cached_video_player.dart';
import 'package:cooking/environment/env.dart';
import 'package:cooking/views/feed/widgets/logo_cooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../custom_icons.dart';
import '../../../models/Post.dart';
import '../../../providers/posts.dart';

class PostVideoItem extends StatefulWidget {
  final Post post;

  const PostVideoItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostVideoItemState createState() => _PostVideoItemState();
}

class _PostVideoItemState extends State<PostVideoItem> {
  late CachedVideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(widget.post.videoUrl);
    _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.post.id),
      onVisibilityChanged: (VisibilityInfo info) {
        if (!mounted) return;
        if (info.visibleFraction >= 0.5) {
          _controller.play();
          _isPlaying = true;
        } else {
          _controller.pause();
          _isPlaying = false;
        }
      },
      child: Stack(
        children: <Widget>[
          _player(),
          _logo(),
          _userPicture(),
          _overlayBtns(),
        ],
      ),
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _player() => GestureDetector(
        onTap: _onVideoTap,
        child: CachedVideoPlayer(_controller),
      );

  Widget _overlayBtns() => Positioned(
        right: 16,
        bottom: 16,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _getIcon("share", CustomIcons.arrow_redo_sharp),
              _getIcon("comments", CustomIcons.chatbubble),
              _ratingBar(),
            ]),
      );

  Widget _getIcon(String tag, IconData icon) => IconButton(
        onPressed: () => _onIconTap(tag),
        icon: Icon(
          icon,
          size: 30,
        ),
      );

  Widget _ratingBar() => RatingBar.builder(
        initialRating: widget.post.note.toDouble(),
        itemCount: 3,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (double note) =>
            Provider.of<PostsProvider>(context, listen: false).notePost(
          newNote: note.toInt(),
          postId: widget.post.id,
          previousNote: widget.post.note,
        ),
      );

  Widget _logo() => LogoCooking();

  Widget _userPicture() => Positioned(
        left: 16,
        bottom: 16,
        child: CircleAvatar(
          radius: 24,
          backgroundImage:
              NetworkImage(assetsUrl + widget.post.author!["avatar"]),
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onIconTap(String tag) {
    switch (tag) {
      default:
        break;
    }
  }

  void _onVideoTap() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    _isPlaying = !_isPlaying;
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////
}
