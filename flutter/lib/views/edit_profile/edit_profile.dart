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
    late User user = Provider.of<UsersProvider>(context).connectedUser as User;

    void onSubmit() {
      if (formKey.currentState!.validate()) {
        print("submit form");
      } else {
        print("bad format !!!");
      }
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
                    ),
                    Field(
                      labelText: "Email",
                      placeholder: user.email,
                      fieldsType: FieldsType.Email,
                    ),
                    Field(
                      labelText: "Age",
                      placeholder: 19.toString(),
                      isAge: true,
                      fieldsType: FieldsType.Age,
                    ),
                    Field(
                      labelText: "Password",
                      placeholder: user.password,
                      isPassword: true,
                      fieldsType: FieldsType.Password,
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
