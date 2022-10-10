// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:cooking/views/feed/widgets/logo_cooking.dart';
import 'package:cooking/widgets/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../providers/posts.dart';
import '../../../providers/users.dart';

class PreviewVideo extends StatefulWidget {
  final File file;
  const PreviewVideo({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PreviewVideoState createState() => _PreviewVideoState();
}

class _PreviewVideoState extends State<PreviewVideo> {
  late CachedVideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.file(widget.file);
    _controller.initialize().then((value) {
      _controller.setLooping(true);
      _controller.play();
      _isPlaying = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
                onTap: _onVideoPlayerTap,
                child: CachedVideoPlayer(_controller)),
            LogoCooking(),
            Positioned(left: 16, top: 16, child: BackArrow()),
            _publishBtn(),
          ],
        ),
      ),
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _publishBtn() => Positioned(
        left: 32,
        right: 32,
        bottom: 16,
        child: ElevatedButton(
          onPressed: _onPublishPressed,
          child: Text("Publier"),
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onVideoPlayerTap() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    _isPlaying = !_isPlaying;
  }

  void _onPublishPressed() async {
    PostsProvider postsProvider =
        Provider.of<PostsProvider>(context, listen: false);
    Response r = await postsProvider.createPost(
        video: widget.file, authorId: UsersProvider.currentUserId ?? "-1");
    print(r.statusCode);
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////
}
