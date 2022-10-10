import 'package:flutter/material.dart';

class LogoCooking extends StatelessWidget {
const LogoCooking({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Positioned(
        right: 16,
        top: 100,
        child: Opacity(
          opacity: 0.8,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Image.asset("assets/images/cooking_logo.png"),
          ),
        ),
      );
  }


//////////////////////////////// WIDGETS ////////////////////////////////



//////////////////////////////// LISTENERS ////////////////////////////////



//////////////////////////////// FUNCTIONS ////////////////////////////////



}