import 'package:cooking/views/nav/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "homepage",
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
