import 'package:camera/camera.dart';
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
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    onNewCameraSelected(cameras[1]);
  }

  @override
  void dispose() {
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
          print(controller!.value.isInitialized);
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
      child: Stack(
        children: [
          _isCameraInitialized
              ? Center(
                  child: AspectRatio(
                    aspectRatio: 1 / controller!.value.aspectRatio,
                    child: controller!.buildPreview(),
                  ),
                )
              : Container(
                  child: Loader(),
                ),
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 20),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCameraInitialized = false;
                    });
                    onNewCameraSelected(
                      cameras[_isRearCameraSelected ? 0 : 1],
                    );
                    setState(() {
                      _isRearCameraSelected = !_isRearCameraSelected;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.black38,
                        size: 60,
                      ),
                      Icon(
                        _isRearCameraSelected
                            ? Icons.camera_front
                            : Icons.camera_rear,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("take picture !");
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
