import 'package:cooking/widgets/scaffolds/cooking_app_bar.dart';
import 'package:flutter/material.dart';

class SecondaryScaffold extends StatelessWidget {
  final Widget body;
  dynamic action = null;

  SecondaryScaffold({
    required this.body,
    this.action
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookingAppBar(action: action),
      body: body,
    );
  }
}
