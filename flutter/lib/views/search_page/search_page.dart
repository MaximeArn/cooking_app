import 'package:cooking/widgets/searchBar/search_bar.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const routeName = "/searchPage";

  const SearchPage();

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              FeedSearchBar(
                isFullPage: true,
              ),
            ],
          )),
    );
  }
}
