import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final String text;
  final Function action;

  EditProfileButton({required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          action();
        },
        child: Text(text),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)))),
      ),
    );
  }
}
