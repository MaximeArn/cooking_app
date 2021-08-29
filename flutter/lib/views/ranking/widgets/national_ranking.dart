import 'package:flutter/material.dart';

class NationalRanking extends StatefulWidget {
  const NationalRanking({Key? key}) : super(key: key);

  @override
  _NationalRankingState createState() => _NationalRankingState();
}

class _NationalRankingState extends State<NationalRanking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      alignment: Alignment.center,
      child: ListView.separated(
        itemBuilder: (_, __) => Card(
            child: ListTile(
          leading: Icon(Icons.star),
          title: Text("User"),
          trailing: Text(
            35.toString(),
          ),
        )),
        separatorBuilder: (_, __) => Divider(),
        itemCount: 5,
      ),
    );
  }
}
