import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:cooking/widgets/searchBar/search_bar.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatelessWidget {
  static const routeName = "/createGroup";
  const CreateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 25),
              child: Text(
                "Create Group",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Name of the group"),
            ),
            // FeedSearchBar(isFullPage: true)
          ],
        ),
      ),
    );
  }
}
