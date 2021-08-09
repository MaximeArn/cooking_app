import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
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
    User user = Provider.of<UsersProvider>(context).connectedUser as User;

    return SecondaryScaffold(
        body: Container(
      margin: EdgeInsets.only(bottom: 80),
      child: GestureDetector(
        onTap: () {},
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
                    fit: BoxFit.cover,
                    image: NetworkImage(user.avatar),
                  ),
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
    ));
  }
}
