import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/ranking/widgets/ranking_line.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NationalRanking extends StatefulWidget {
  const NationalRanking({Key? key}) : super(key: key);

  @override
  _NationalRankingState createState() => _NationalRankingState();
}

class _NationalRankingState extends State<NationalRanking> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final usersProvider = Provider.of<UsersProvider>(context);

    return FutureBuilder(
        future: usersProvider.getNationalRanking("FR"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (usersProvider.isLoading) {
            return Loader();
          } else {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              alignment: Alignment.center,
              child: ListView.separated(
                itemBuilder: (_, int index) => RankingLine(
                  user: snapshot.data[index],
                  index: index,
                ),
                separatorBuilder: (_, __) => Divider(
                  indent: 0.30 * width,
                  endIndent: 0.30 * width,
                  height: 20,
                  thickness: 2,
                  color: Colors.black38,
                ),
                itemCount: snapshot.data.length,
              ),
            );
          }
        });
  }
}
