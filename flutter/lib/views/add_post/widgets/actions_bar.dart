import 'package:cooking/views/add_post/widgets/captured_pictures_thumbnail.dart';
import 'package:flutter/material.dart';

class ActionsBar extends StatelessWidget {
  final VoidCallback toggleCamera;
  final bool isRearCameraSelected;
  final VoidCallback takePicture;
  final List lastCapturedPictures;

  const ActionsBar({
    Key? key,
    required this.toggleCamera,
    required this.isRearCameraSelected,
    required this.takePicture,
    required this.lastCapturedPictures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.black26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: toggleCamera,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.black38,
                    size: 60,
                  ),
                  Icon(
                    isRearCameraSelected
                        ? Icons.camera_front
                        : Icons.camera_rear,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.black38, size: 60),
                  Icon(
                    Icons.camera_alt,
                    size: 30,
                  )
                ],
              ),
              onTap: takePicture,
            ),
            CapturedPicturesThumbnail(lastCapturedPictures: lastCapturedPictures,)
          ],
        ),
      ),
    );
  }
}