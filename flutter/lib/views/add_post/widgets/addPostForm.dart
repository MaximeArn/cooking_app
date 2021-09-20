import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

class AddPostForm extends StatefulWidget {
  static const String routeName = "/addPostForm";
  const AddPostForm({Key? key}) : super(key: key);

  @override
  _AddPostFormState createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  @override
  Widget build(BuildContext context) {
    final dynamic image = ModalRoute.of(context)!.settings.arguments;
    log(image.path);
    return Container(
      alignment: Alignment.center,
      child: Image.file(File(image.path)),
    );
  }
}
