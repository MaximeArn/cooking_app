import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final String text;

  EditProfileButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))),
      ),
    );
  }
}
