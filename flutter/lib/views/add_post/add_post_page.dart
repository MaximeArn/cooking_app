import 'dart:io';

import 'package:cooking/views/add_post/edit_video_page.dart';
import 'package:cooking/views/add_post/record_video_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text("Publier une nouvelle vidéo",
              style: TextStyle(
                fontSize: 26,
              )),
          const Spacer(),
          Center(
            child: Row(
              children: <Widget>[
                const Spacer(),
                _getBtn(
                  context,
                  "Capturer une vidéo",
                  0,
                  Icons.camera_alt_rounded,
                ),
                const Spacer(),
                _getBtn(
                  context,
                  "Sélectionner vidéo\ndepuis la galerie",
                  1,
                  Icons.upload,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _getBtn(BuildContext context, String tag, int index, IconData icon) =>
      InkWell(
        onTap: () => _onBtnTap(context, index),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 42),
            Text(
              tag,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onBtnTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        _onCameraBtnTap(context);
        break;
      case 1:
        _onFromGalleryBtnTap(context);
        break;
    }
  }

  void _onCameraBtnTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => RecordVideoPage(),
      ),
    );
  }

  void _onFromGalleryBtnTap(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result == null) return;
    String? path = result.files.single.path;
    if (path == null) return;
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => EditVideoPage(
          videoFile: File(path),
        ),
      ),
    );
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////
}
