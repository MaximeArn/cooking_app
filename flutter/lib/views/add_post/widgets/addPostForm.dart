import 'dart:developer';
import 'dart:io';

import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
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
    return SecondaryScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.file(File(image.path)),
      ),
    );
  }
}
