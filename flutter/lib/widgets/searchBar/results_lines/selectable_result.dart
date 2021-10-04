import 'package:cooking/environment/env.dart';
import 'package:flutter/material.dart';

class SelectableResult extends StatefulWidget {
  final user;

  const SelectableResult({Key? key, required this.user}) : super(key: key);

  @override
  _SelectableResultState createState() => _SelectableResultState();
}

class _SelectableResultState extends State<SelectableResult> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: selected,
        onChanged: (bool? value) {
          if (value != null) {
            setState(() {
              selected = value;
            });
          }
        },
        secondary: CircleAvatar(
          backgroundImage: NetworkImage(serverUrl + widget.user["avatar"]),
        ),
        title: Text(widget.user["name"]),
      ),
    );
  }
}
