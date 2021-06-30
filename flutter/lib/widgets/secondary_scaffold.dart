import 'package:cooking/widgets/cooking_app_bar.dart';
import 'package:cooking/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class SecondaryScaffold extends StatelessWidget {
  final Widget body;

  SecondaryScaffold({
    required this.body,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookingAppBar(),
      drawer: SidePanel(),
      body: body,
    );
  }
}
