import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:cooking/widgets/searchBar/search_bar.dart';
import 'package:flutter/material.dart';

class AddMembers extends StatelessWidget {
  static const routeName = "/createGroup";
  const AddMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Container(
        child: Column(
          children: [
            FeedSearchBar(isFullPage: true, addMembersPage: true,)
          ],
        ),
      ),
    );
  }
}
