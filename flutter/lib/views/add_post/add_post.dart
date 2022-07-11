import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import "../../main.dart";

class AddPost extends StatefulWidget {
  const AddPost({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPost> createState() => _State();
}

class _State extends State<AddPost> {
  @override
  void initState() {
    super.initState();
    onNewCameraSelected(cameras[0]);
  }

  CameraController? controller;
  bool _isCameraInitialized = false;

  void onNewCameraSelected(CameraDescription selectedCamera) async {
    try {
      final previousCameraController = controller;

      final CameraController cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.high,
      );

      await previousCameraController?.dispose();

      if (mounted) {
        setState(() {
          controller = cameraController;
        });
      }

      cameraController.addListener(() {
        if (mounted) setState(() {});
      });

      if (mounted) {
        setState(() {
          _isCameraInitialized = controller!.value.isInitialized;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text("TakePicture"),
          ),
        ],
      ),
    );
  }
}
