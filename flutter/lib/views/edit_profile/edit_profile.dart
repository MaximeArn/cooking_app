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
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UsersProvider>(context, listen: false)
        .connectedUser as User;

    bool avatarHasBeenChanged = false;

    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void onSubmit() {
      if (formKey.currentState!.validate()) {
        print("Fields Validated");
      } else {
        print("Fields not Validated");
      }
    }

    void onCancel() {
      Navigator.of(context).pop();
    }

    @override
    void dispose() {
      super.dispose();
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
    }

    // dynamic nameValidator(String value) {
    //   print("name validator");
    // }

    // dynamic emailValidator(String value) {
    //   print("email validator");
    //   print(widget.emailRegex.hasMatch(value).toString());
    //   return widget.emailRegex.hasMatch(value)
    //       ? Exception("email does not match ")
    //       : null;
    // }

    // dynamic passwordValidator(String value) {
    //   print("password validator");
    //   return null;
    // }

    return SecondaryScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              avatarHasBeenChanged ? EditableAvatar(image: NetworkImage(user.name)) :  EditableAvatar(image: NetworkImage(user.avatar)),
              Container(
                padding: EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    Field(
                      labelText: "Name",
                      placeholder: user.name,
                      controller: nameController,
                      validator: (value) {
                        String trimedValue = value!.trim();
                        if (trimedValue == null || trimedValue.isEmpty) {
                          return 'Please enter some text';
                          // nameController.text.trim();
                        }
                        return null;
                      },
                    ),
                    Field(
                      labelText: "Email",
                      placeholder: user.email,
                      controller: emailController,
                      validator: (value) {
                        String trimedValue = value!.trim();
                        if (trimedValue == null ||
                            trimedValue.isEmpty ||
                            !widget.emailRegex.hasMatch(value)) {
                          emailController.text.trim();
                          return 'Invalid email format';
                        }
                      },
                    ),
                    Field(
                        labelText: "Password",
                        placeholder: user.password,
                        isPassword: true,
                        controller: passwordController,
                        validator: (value) {
                          String trimedValue = value!.trim();
                          if (trimedValue == null || trimedValue.isEmpty) {
                            return 'Please enter some text';
                            // passwordController.text.trim();
                          }
                          return null;
                        })
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
      ),
    );
  }
}
