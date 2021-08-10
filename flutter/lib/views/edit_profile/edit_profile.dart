import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'widgets/field.dart';

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
    final GlobalKey formKey = GlobalKey<FormState>();
    late User user = Provider.of<UsersProvider>(context).connectedUser as User;

    void onSubmit() {
      print("submit form");
    }

    void onCancel() {
      print("pop location");
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
                    Field(labelText: "Name", placeholder: user.name),
                    Field(labelText: "Email", placeholder: user.email),
                    Field(
                        labelText: "Age",
                        placeholder: 19.toString(),
                        isBirth: true),
                    Field(
                      labelText: "Password",
                      placeholder: user.password,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
