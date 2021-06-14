import 'package:cooking/views/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "homepage",
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
