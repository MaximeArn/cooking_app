import 'package:cooking/widgets/scaffolds/cooking_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondaryScaffold extends StatelessWidget {
  final Widget body;
  dynamic action;

  SecondaryScaffold({required this.body, this.action = null});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookingAppBar(action: action),
      body: body,
    );
  }
}
