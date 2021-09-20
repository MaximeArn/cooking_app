import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cooking/views/add_post/widgets/preview_screen.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';

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
                  child: Image.file(photo as File),
                )
              : PreviousScreen(controller: _controller, setPhoto: setPhoto);
        } else {
          return const Loader();
        }
      },
    );
  }
}
