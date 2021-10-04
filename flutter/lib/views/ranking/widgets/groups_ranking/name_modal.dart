import 'package:cooking/views/ranking/widgets/groups_ranking/add_members.dart';
import 'package:flutter/material.dart';

class NameModal extends StatelessWidget {
  const NameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text("Enter a name"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Name"),
          ),
          Divider(
            height: 40,
            thickness: 0,
            color: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AddMembers.routeName);
                  },
                  child: Text("Create")),
            ],
          ),
        ],
      ),
    );
  }
}
