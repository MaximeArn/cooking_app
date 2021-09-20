import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviousScreen extends StatelessWidget {
  final CameraController controller;
  final Function setPhoto;

  const PreviousScreen({
    Key? key,
    required this.controller,
    required this.setPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(flex: 9, child: CameraPreview(controller)),
          Flexible(
              flex: 1,
              child: FloatingActionButton(onPressed: () async {
                setPhoto(await controller.takePicture());
                // controller.value =
                // File(image);
                // Navigator.pushNamed(context, "/addPostForm", arguments: image);
              }))
        ],
      ),
    );
  }
}
