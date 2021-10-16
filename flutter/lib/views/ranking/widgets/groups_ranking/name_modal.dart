import 'package:cooking/views/ranking/widgets/groups_ranking/add_members.dart';
import 'package:flutter/material.dart';

class NameModal extends StatelessWidget {
  const NameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
              maxLength: 20,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
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
                  if(formKey.currentState!.validate()){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AddMembers.routeName);
                  };
                },
                child: Text("Add members")),
          ],
        ),
      ),
    );
  }
}