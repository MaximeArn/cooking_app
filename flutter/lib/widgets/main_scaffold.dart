import 'package:cooking/widgets/bottom_navigation.dart';
import 'package:cooking/widgets/cooking_app_bar.dart';
import 'package:cooking/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  final Widget body;

MainScaffold({required this.body});

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
   late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  void setIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookingAppBar(),
      drawer: SidePanel(),
      bottomNavigationBar: BottomNavigation(index: index, setIndex: setIndex),
      body: widget.body,
    );
  }
}