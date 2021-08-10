import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'widgets/edit_profile_button.dart';
import 'widgets/field.dart';

enum FieldsType { Email, Age, Name, Password }

class EditProfile extends StatefulWidget {
  static const routeName = "/editProfile";
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp ageRegex = RegExp("^[0-9]*\$");
  final RegExp nameRegex = RegExp("^[A-Za-z,.'-]+\$");
  final RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

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

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    fieldValidator(value, FieldsType fieldtype) {
      value.trim();
      if (value.isEmpty) {
        return "Please enter some text";
      }
      // Email tests
      else if (fieldtype == FieldsType.Email &&
          !widget.emailRegex.hasMatch(value)) {
        print(widget.emailRegex.hasMatch(value));
        return "Invalid email format";
      }
      // Age tests
      else if (fieldtype == FieldsType.Age) {
        if (value == null || !widget.ageRegex.hasMatch(value)) {
          return "Invalid age format";
        }

        value = int.tryParse(value);
        if (!(value > 15 && value < 100)) {
          return "Age must be between 15 and 100";
        }
      }
      // Name tests
      else if (fieldtype == FieldsType.Name) {
        if (!widget.nameRegex.hasMatch(value)) {
          return "Only alphabetic characters allowed";
        }
        if (value.length > 25) return "Name length must be under 25";
      }

      //password tests
      else if (fieldtype == FieldsType.Password && !widget.passwordRegex.hasMatch(value)) {
          return "invalid password format";
      }
      // final validation
      else {
        return null;
      }
    }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
                      validator: (value) {
                        return fieldValidator(value, FieldsType.Name);
                      },
                    ),
                    Field(
                      labelText: "Email",
                      placeholder: user.email,
                      validator: (value) {
                        return fieldValidator(value, FieldsType.Email);
                      },
                    ),
                    Field(
                      labelText: "Age",
                      placeholder: 19.toString(),
                      isAge: true,
                      validator: (value) {
                        return fieldValidator(value, FieldsType.Age);
                      },
                    ),
                    Field(
                      labelText: "Password",
                      placeholder: user.password,
                      isPassword: true,
                      validator: (value) {
                        return fieldValidator(value, FieldsType.Password);
                      },
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
