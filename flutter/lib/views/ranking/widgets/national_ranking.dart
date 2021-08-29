import 'package:flutter/material.dart';

class NationalRanking extends StatefulWidget {
  const NationalRanking({ Key? key }) : super(key: key);

  @override
  _NationalRankingState createState() => _NationalRankingState();
}

class _NationalRankingState extends State<NationalRanking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("National !"),
    );
  }
}