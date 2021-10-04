import 'package:flutter/material.dart';

class AddGroupModal extends StatelessWidget {
  const AddGroupModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      scrollable: true,
      title: Center(child: Text('Create Group')),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.account_box),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
