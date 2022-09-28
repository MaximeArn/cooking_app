// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cooking/views/edit_profile/edit_profile.dart';
import 'package:cooking/widgets/drawer/cooking_drawer.dart';
import 'package:cooking/widgets/scaffolds/bottom_navigation.dart';
import 'package:cooking/widgets/scaffolds/cooking_app_bar.dart';

class MainScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget body;
  final int index;
  final void Function(int) setIndex;

  MainScaffold({
    Key? key,
    required this.scaffoldKey,
    required this.body,
    required this.index,
    required this.setIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: _currentAppBar( context),
      drawer: const CookingDrawer(),
      bottomNavigationBar: BottomNavigation(index: index, setIndex: setIndex),
      body: body,
    );
  }

    PreferredSizeWidget? _currentAppBar(BuildContext context) {
    switch (index) {
      case 0:
        return null;
      case 1:
        return CookingAppBar(
          hasBottomShadow: false,
        );
      case 4:
        return CookingAppBar(
          action: IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, EditProfile.routeName),
            icon: Icon(Icons.edit),
          ),
        );
      default:
        return CookingAppBar();
    }
  }
}
