import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  static String routeName = "/challenges";
  const FriendsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Center(
        child: Text("Friends List"),
      ),
    );
  }
}
