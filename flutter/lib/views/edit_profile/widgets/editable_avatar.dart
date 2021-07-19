import 'dart:io';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditableAvatar extends StatelessWidget {
  const EditableAvatar();

  @override
  Widget build(BuildContext context) {
    final User? user =
        Provider.of<UsersProvider>(context, listen: false).connectedUser;
    late File deviceImage;

    Future<void> getImage() async {
      final ImagePicker imagePicker = ImagePicker();
      final PickedFile pickedFile = await imagePicker.pickImage(
          source: ImageSource.gallery) as PickedFile;
      File deviceImage = File(pickedFile.path);
      if (deviceImage != null) {
        print("image is ok");
      }
      try {} catch (e) {
        rethrow;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: GestureDetector(
        onTap: () {
          getImage();
        },
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
                      fit: BoxFit.cover, image: NetworkImage(user!.avatar)),
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
