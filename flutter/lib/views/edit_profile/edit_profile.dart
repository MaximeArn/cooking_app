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
    late User user = Provider.of<UsersProvider>(context).connectedUser as User;
    String avatar = user.avatar;

    void setImage() {
      print(avatar);
      //must modifiy the image in provider because on rebuild the db avatar is re-set 
      user.avatar =
          "https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg";
      setState(() {});
      print(avatar);
    }

    return SecondaryScaffold(
        body: Container(
      margin: EdgeInsets.only(bottom: 80),
      child: GestureDetector(
        onTap: setImage,
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
                    image: NetworkImage(avatar),
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
