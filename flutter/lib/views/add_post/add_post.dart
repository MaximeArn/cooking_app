import 'package:camera/camera.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Container(child: CameraPreview(_controller));
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
