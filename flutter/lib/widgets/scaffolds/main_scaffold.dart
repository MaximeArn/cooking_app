import 'package:cooking/widgets/scaffolds/bottom_navigation.dart';
import 'package:cooking/widgets/scaffolds/cooking_app_bar.dart';
import 'package:cooking/widgets/scaffolds/side_panel.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int index;
  final void Function(int) setIndex;

  MainScaffold({
    required this.body,
    required this.index,
    required this.setIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CookingAppBar(),
      drawer: const SidePanel(),
      bottomNavigationBar: BottomNavigation(index: index, setIndex: setIndex),
      body: body,
    );
  }
}
