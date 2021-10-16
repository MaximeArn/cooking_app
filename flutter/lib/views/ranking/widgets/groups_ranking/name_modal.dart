import 'package:cooking/models/Group.dart';
import 'package:cooking/providers/groups.dart';
import 'package:cooking/views/ranking/widgets/groups_ranking/add_members.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameModal extends StatelessWidget {
  const NameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final Group newGroup = Provider.of<GroupsProvider>(context).newGroup;
    final TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Center(
        child: Text("Enter a name"),
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              maxLength: 20,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  print("test");
                  return "Please enter some text";
                }
                return null;
              },
              decoration: InputDecoration(hintText: "Name"),
            ),
            Divider(
              height: 40,
              thickness: 0,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AddMembers.routeName);
                    newGroup.setName(controller.value.text);
                  }
                  ;
                },
                child: Text("Add members")),
          ],
        ),
      ),
    );
  }
}
