import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final bool isPassword;
  final String labelText;
  final String placeholder;

  Field({this.isPassword = false, required this.labelText, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: TextField(
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(232, 196, 81, 1))
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(232, 196, 81, 1))
          ),
          contentPadding: EdgeInsets.only(bottom: 5, left: 25),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color.fromRGBO(232, 196, 81, 1)
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16
          )
        ),
      ),
    );
  }
}
