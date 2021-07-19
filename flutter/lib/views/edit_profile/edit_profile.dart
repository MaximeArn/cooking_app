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

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController birthController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    void onSubmit() {
      // do something
    }

    void onCancel() {
      Navigator.of(context).pop();
    }

    @override
    void dispose() {
      super.dispose();
      nameController.dispose();
      emailController.dispose();
      birthController.dispose();
      passwordController.dispose();
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
                    controller: nameController,
                  ),
                  Field(
                    labelText: "Email",
                    placeholder: user.email,
                    controller: emailController,
                  ),
                  Field(
                    labelText: "Birth",
                    placeholder: 19.toString(),
                    isBirth: true,
                    controller: birthController,
                  ),
                  Field(
                    labelText: "Password",
                    placeholder: user.password,
                    isPassword: true,
                    controller: passwordController,
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
