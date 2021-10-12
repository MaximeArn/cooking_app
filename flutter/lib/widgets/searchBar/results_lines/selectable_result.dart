import 'package:cooking/environment/env.dart';
import 'package:cooking/providers/groups.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final addMember =
        Provider.of<GroupsProvider>(context, listen: false).addMember;
    final removeMember =
        Provider.of<GroupsProvider>(context, listen: false).removeMember;

    return Card(
      child: CheckboxListTile(
        value: selected,
        onChanged: (bool? value) {
          if (value != null) {
            print(value);
            value ? addMember(widget.user) : removeMember(widget.user["id"]);
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
