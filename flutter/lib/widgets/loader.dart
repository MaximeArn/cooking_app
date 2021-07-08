import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
