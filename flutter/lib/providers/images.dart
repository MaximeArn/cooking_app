import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagesProvider with ChangeNotifier {
  List<CameraDescription> _cameras = [];

  get cameras => _cameras;

  void initAvailableCameras() async {
    try {
      _cameras = await availableCameras();
      print("${cameras.length} cameras available");

    } on CameraException catch (e) {
      print(e);
      rethrow;
    }
  }
}
