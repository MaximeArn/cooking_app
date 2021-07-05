import 'package:cooking/models/User.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return SecondaryScaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 33,
              child: Container(
                  color: Colors.green,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.topCenter,
                            color: Color.fromRGBO(223, 102, 103, 1),
                            padding: EdgeInsets.only(top: 25),
                            child: Text(user.name, style: TextStyle(fontSize: 25),),
                          )),
                          Expanded(child: Container()),
                        ],
                      ),
                       Container(
                            alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                      )
                    ],
                  )),
            ),
            Flexible(
              flex: 67,
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Mes Plats")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
