import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/edit_profile/widgets/editable_avatar.dart';
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
    bool avatarHasBeenModified = false;

    toggleAvatarHasBeenModified() {
      avatarHasBeenModified = !avatarHasBeenModified;
    }

    late User user = Provider.of<UsersProvider>(context).connectedUser as User;

    return SecondaryScaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          EditableAvatar(
            avataHasBeenModified: avatarHasBeenModified, 
            toggleAvatarHasBeenModified: toggleAvatarHasBeenModified,
          ),
        ],
      ),
    ));
  }
}
