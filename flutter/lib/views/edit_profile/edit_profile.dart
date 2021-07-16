import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/editProfile";

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UsersProvider>(context).connectedUser;

    return SecondaryScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Flexible(
              flex: 3,
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
                            image: NetworkImage(user!.avatar)),
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
                          border: Border.all(color: Colors.black, width: 1.5)
                        ),
                        child: Icon(Icons.edit, size: 19,),
                    ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Column(
                  children: [],
                )),
            Flexible(
                flex: 3,
                child: Column(
                  children: [],
                )),
          ],
        ),
      ),
    );
  }
}
