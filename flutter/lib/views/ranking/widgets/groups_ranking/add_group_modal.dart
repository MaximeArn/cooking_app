import 'package:flutter/material.dart';

class AddGroupModal extends StatelessWidget {
  const AddGroupModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: size.height * .7,
        width: double.infinity,
        child: Column(
          children: [
            Text("Create Group")
          ],
        ),
      ),
    );
  }
}
