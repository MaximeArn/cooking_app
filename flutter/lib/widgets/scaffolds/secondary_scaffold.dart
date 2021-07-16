import 'package:cooking/widgets/scaffolds/cooking_app_bar.dart';
import 'package:flutter/material.dart';

class SecondaryScaffold extends StatelessWidget {
  final Widget body;

  SecondaryScaffold({
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CookingAppBar(
        isOwnProfile: false,
      ),
      body: body,
    );
  }
}
