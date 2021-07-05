import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatar;

  ProfileHeader({required this.name, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 30,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              123.toString(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(232, 196, 81, .7)
                              ),
                            ),
                            Text("Etoiles", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                       Expanded(
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              345.toString(),
                               style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(232, 196, 81, .7)
                              ),
                            ),
                            Text("Abonnés",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                          ],
                                             ),
                       ),
                       Expanded(
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              97.toString(),
                               style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(232, 196, 81, .7)
                              ),
                            ),
                            Text("Abonnements",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                          ],
                                             ),
                       ),
                    ],
                  ),
                ),
              ),
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
