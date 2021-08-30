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
    final List<Map<String, dynamic>> nationalRanking =
        Provider.of<UsersProvider>(context).nationalRanking;
    final bool isLoading = Provider.of<UsersProvider>(context).isLoading;
    final getNationalRanking = Provider.of<UsersProvider>(context, listen: false).getNationalRanking;

    return isLoading
        ? Loader()
        : RefreshIndicator(
          onRefresh: () => getNationalRanking(),
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              alignment: Alignment.center,
              child: Card(
                elevation: 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (_, int index) => RankingLine(
                      user: nationalRanking[index],
                      index: index,
                    ),
                    separatorBuilder: (_, __) => Divider(
                      indent: 0.30 * width,
                      endIndent: 0.30 * width,
                      height: 20,
                      thickness: 2,
                      color: Colors.black38,
                    ),
                    itemCount: nationalRanking.length,
                  ),
                ),
              ),
            ),
        );
  }
}
