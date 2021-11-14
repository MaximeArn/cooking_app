import 'package:flutter/material.dart';

class RankingTable extends StatelessWidget {
  const RankingTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
      child: Table(
        border: TableBorder.all(width: 1, color: Colors.black),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Rank"),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name"),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Points"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
