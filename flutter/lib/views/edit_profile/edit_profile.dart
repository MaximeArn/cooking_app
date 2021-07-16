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
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user!.avatar),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
