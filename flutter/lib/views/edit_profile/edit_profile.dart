import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'widgets/edit_profile_button.dart';
import 'widgets/field.dart';

class EditProfile extends StatefulWidget {
  static const routeName = "/editProfile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final ageController = TextEditingController();
    final passwordController = TextEditingController();
    late User user = Provider.of<UsersProvider>(context).connectedUser as User;

    void onSubmit() {
      if (formKey.currentState!.validate()) {
        print("submit form");
        Provider.of<UsersProvider>(context, listen: false).updateUser(
          name: nameController.text,
          email: emailController.text,
          age: ageController.text,
          pwd: passwordController.text,
        );
      } else {
        print("bad format !!!");
      }
    }

    @override
    void initState() {
      nameController.addListener(() {});
      emailController.addListener(() {});
      ageController.addListener(() {});
      passwordController.addListener(() {});
      super.initState();
    }

    @override
    void dispose() {
      nameController.dispose();
      emailController.dispose();
      ageController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    void onCancel() {
      Navigator.pop(context);
    }

    return SecondaryScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              EditableAvatar(),
              Container(
                padding: EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    Field(
                      labelText: "Name",
                      placeholder: user.name,
                      fieldsType: FieldsType.Name,
                      controller: nameController,
                    ),
                    Field(
                      labelText: "Email",
                      placeholder: user.email,
                      fieldsType: FieldsType.Email,
                      controller: emailController,
                    ),
                    Field(
                      labelText: "Age",
                      placeholder: 19.toString(),
                      isAge: true,
                      fieldsType: FieldsType.Age,
                      controller: ageController,
                    ),
                    Field(
                      labelText: "Password",
                      placeholder: user.password,
                      isPassword: true,
                      fieldsType: FieldsType.Password,
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
      ),
    );
  }
}
