import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cooking/views/add_post/widgets/actions_bar.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import "../../main.dart";

class AddPost extends StatefulWidget {
  const AddPost({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPost> createState() => _State();
}

class _State extends State<AddPost> with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool isRearCameraSelected = true;
  List<File> lastCapturedPictures = [];

  @override
  void initState() {
    super.initState();
    onNewCameraSelected(cameras[0]);
  }

  @override
  void dispose() {
    print(lastCapturedPictures.length);
    lastCapturedPictures = [];
    super.dispose();
    controller?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

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

      try {
        await cameraController.initialize();
      } on CameraException catch (e) {
        print('Error initializing camera: $e');
      }

      if (mounted) {
        setState(() {
          _isCameraInitialized = controller!.value.isInitialized;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleCamera() {
    setState(() {
      _isCameraInitialized = false;
    });
    onNewCameraSelected(
      cameras[isRearCameraSelected ? 0 : 1],
    );
    setState(() {
      isRearCameraSelected = !isRearCameraSelected;
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController!.value.isTakingPicture) {
      print("a image is already being captured please wait ! ");
      return null;
    }
    try {
      final picture = await cameraController.takePicture();
      final filePicture = File(picture.path);
      lastCapturedPictures.add(filePicture);

      return picture;
    } catch (e) {
      print('Error occured while taking picture: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _isCameraInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: 1 / controller!.value.aspectRatio,
                  child: controller!.buildPreview(),
                ),
              )
            : Loader(),
        _isCameraInitialized
            ? ActionsBar(
                toggleCamera: toggleCamera,
                isRearCameraSelected: isRearCameraSelected,
                takePicture: takePicture,
                lastCapturedPictures: lastCapturedPictures,
              )
            : Container()
      ],
    );
  }
}
