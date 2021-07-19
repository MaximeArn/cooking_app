import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/edit_profile_button.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
import 'package:cooking/views/edit_profile/widgets/field.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  static const routeName = "/editProfile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UsersProvider>(context, listen: false)
        .connectedUser as User;
    final TextEditingController editProfileController = TextEditingController();

    void onSubmit() {
      print(editProfileController.value);
    }

    void onCancel (){
      Navigator.of(context).pop();
    }
    
    

    return SecondaryScaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            EditableAvatar(),
            Container(
              padding: EdgeInsets.only(bottom: 70),
              child: Column(
                children: [
                  Field(
                    labelText: "Name",
                    placeholder: user.name,
                    controller: editProfileController,
                  ),
                  Field(
                    labelText: "Email",
                    placeholder: user.email,
                    controller: editProfileController,
                  ),
                  Field(
                    labelText: "Age",
                    placeholder: 19.toString(),
                    isAge: true,
                    controller: editProfileController,
                  ),
                  Field(
                    labelText: "Password",
                    placeholder: user.password,
                    isPassword: true,
                    controller: editProfileController,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditProfileButton(text: "Cancel", action: onCancel),
                SizedBox(width: 50),
                EditProfileButton(text: "Save", action: onSubmit),
              ],
            )
          ],
        ),
      ),
    );
  }
}
