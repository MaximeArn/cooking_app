import 'dart:io';

import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditableAvatar extends StatefulWidget {
  static const routeName = "/editProfile";

  @override
  _EditableAvatarState createState() => _EditableAvatarState();
}

class _EditableAvatarState extends State<EditableAvatar> {
  @override
  Widget build(BuildContext context) {
    late User user = Provider.of<UsersProvider>(context).connectedUser as User;
    String avatar = assetsUrl + user.avatar;

    ImagePicker imagePicker = ImagePicker();

    Future<void> pickImage() async {
      try {
        XFile? pickedImage =
            await imagePicker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          File pickedFile = File(pickedImage.path);
          setState(() {
            user.fileImage = pickedFile;
          });
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
                    image: user.fileImage == null
                        ? NetworkImage(avatar)
                        : FileImage(user.fileImage as File) as ImageProvider,
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
