import 'package:flutter/material.dart';

class FeedSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ), 
        ),
      ),
      color: Color.fromRGBO(232,196,81,.7,),
    );
  }
}
