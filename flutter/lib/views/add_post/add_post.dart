import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPost> createState() => _State();
}

class _State extends State<AddPost> {
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    availableCameras().then((camerasList) {
      cameras = camerasList;
    });
    print(cameras.length);
    // getCameras();
  }

  // final getCameras = () async {
  //   try {
  //     cameras = await availableCameras();
  //   } on CameraException catch (e) {
  //     print('Error in fetching the cameras: $e');
  //   }
  // };

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
