import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableAvatar extends StatefulWidget {
  final ImageProvider image;
  final Function setImage;

  EditableAvatar({
    required this.image,
    required this.setImage,
  });

  @override
  _EditableAvatarState createState() => _EditableAvatarState();
}

class _EditableAvatarState extends State<EditableAvatar> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final picker = ImagePicker();

    Future<void> pickImage() async {
      try {
        XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          widget.setImage(FileImage(File("/Users/maxime/Library/Developer/CoreSimulator/Devices/A25F91DF-E64B-4F09-AC66-3532673201F2/data/Containers/Data/Application/48E9CB72-CF9F-4A1F-9388-F15AAB6F468C/tmp/image_picker_AEC92256-0C39-4E42-8034-9515A11ED62B-13246-00000BD0AFB741B7.jpg")));
        }
      } catch (e) {
        rethrow;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.image,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5)),
                  child: Icon(
                    Icons.edit,
                    size: 19,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
