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
  @override
  Widget build(BuildContext context) {
    final addMember =
        Provider.of<GroupsProvider>(context, listen: false).addMember;
    final removeMember =
        Provider.of<GroupsProvider>(context, listen: false).removeMember;
    final selectedMembers =
        Provider.of<GroupsProvider>(context).newGroup.members;

    bool setSelected(user) {
      for (var member in selectedMembers) {
        if (member["id"] == widget.user["id"]) return true;
      }
      return false;
    }

    bool selected = setSelected(widget.user);

    return Card(
      child: CheckboxListTile(
        value: selected,
        onChanged: (bool? value) {
          if (value != null) {
            value ? addMember(widget.user) : removeMember(widget.user["id"]);
            setState(() {
              selected = setSelected(widget.user);
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
