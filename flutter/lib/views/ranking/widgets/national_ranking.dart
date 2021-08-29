import 'package:cooking/views/profiles/profile/profile.dart';
import 'package:flutter/material.dart';

class NationalRanking extends StatefulWidget {
  const NationalRanking({Key? key}) : super(key: key);

  @override
  _NationalRankingState createState() => _NationalRankingState();
}

class _NationalRankingState extends State<NationalRanking> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      alignment: Alignment.center,
      child: ListView.separated(
        itemBuilder: (_, __) => Card(
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, Profile.routeName, arguments: "REMPLACER PAR L'ID"),
          leading: Icon(Icons.star),
          title: Text("User"),
          trailing: Text(
            35.toString(),
          ),
        )),
        separatorBuilder: (_, __) => Divider(
          indent: 0.30 * width,
          endIndent: 0.30 * width,
          height: 20,
          thickness: 2,
          color: Colors.black38,
        ),
        itemCount: 5,
      ),
    );
  }
}
