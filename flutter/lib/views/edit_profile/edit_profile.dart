import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/edit_profile_button.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
import 'package:cooking/views/edit_profile/widgets/field.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/editProfile";

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UsersProvider>(context, listen: false).connectedUser as User;

    return SecondaryScaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: [
            const EditableAvatar(),
            Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Field(labelText: "Name", placeholder: user.name),
                    Field(labelText: "Email", placeholder: user.email),
                     Field(labelText: "Password", placeholder: user.password, isPassword: true,),
                  ],
                )),
            Flexible(
                flex: 3,
                child: Row(
                  children: [
                    EditProfileButton(text: "Cancel"),
                    EditProfileButton(text: "Save"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
