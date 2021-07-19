import 'dart:io';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditableAvatar extends StatefulWidget {
  @override
  _EditableAvatarState createState() => _EditableAvatarState();
}

class _EditableAvatarState extends State<EditableAvatar> {
  @override
  Widget build(BuildContext context) {
    final User? user =
        Provider.of<UsersProvider>(context, listen: true).connectedUser;
    File? _deviceImage;
    final picker = ImagePicker();

    Future<void> _pickImage() async {
      try {
        XFile? pickedFile =
            await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          _deviceImage = File(pickedFile.path);
          print("pickedFIle is all right !!!");
        } else {
          print("putain de merde");
        }
      } catch (e) {
        rethrow;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: GestureDetector(
        onTap: _pickImage,
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
