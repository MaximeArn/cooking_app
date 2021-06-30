import 'package:cooking/views/nav/widgets/bottom_navigation.dart';
import 'package:cooking/views/nav/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidePanel(),
      // bottomNavigationBar: BottomNavigation(),
      body: Container(
        alignment: Alignment.center,
        child: Text('Not Found'),
      ),
    );
  }
}
