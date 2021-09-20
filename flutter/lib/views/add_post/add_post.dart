import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/add_post/widgets/preview_screen.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  final CameraDescription camera;

  AddPost({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool photoWasTaken = false;
  File? photo = null;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.yuv420);

    _initializeControllerFuture = _controller.initialize();
  }

  void setPhoto(photoFile) {
    print("setPhoto");
    photo = File(photoFile.path);
    setState(() {
      photoWasTaken = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return photoWasTaken
              ? Center(
                  child: Stack(children: [
                    Image.file(photo as File),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: () {
                              Provider.of<PostsProvider>(context, listen: false)
                                  .createPost(
                                      images: [photo as File], authorId: "60e8c2140e7c9296fa2380c3");
                            },
                            child: Text("Post ")))
                  ]),
                )
              : PreviousScreen(controller: _controller, setPhoto: setPhoto);
        } else {
          return const Loader();
        }
      },
    );
  }
}
