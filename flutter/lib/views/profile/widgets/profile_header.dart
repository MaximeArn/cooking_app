import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatar;

  ProfileHeader({required this.name, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 33,
      child: Container(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(223, 102, 103, 1),
                    border: Border(bottom: BorderSide(width: 1))),
                padding: EdgeInsets.only(top: 35),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 25),
                ),
              )),
              Expanded(child: Container()),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 46,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(avatar),
              ),
            ),
          )
        ],
      )),
    );
  }
}
