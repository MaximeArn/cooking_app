import 'package:cooking/providers/users.dart';
import 'package:cooking/views/ranking/widgets/national_ranking/connected_user_rank.dart';
import 'package:cooking/views/ranking/widgets/national_ranking/national_ranking_line.dart';
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
    final List<Map<String, dynamic>> nationalRanking =
        Provider.of<UsersProvider>(context).nationalRanking;
    final bool isLoading = Provider.of<UsersProvider>(context).isLoading;
    final getNationalRanking =
        Provider.of<UsersProvider>(context, listen: false).getNationalRanking;
    final connectedUser = Provider.of<UsersProvider>(context).connectedUser;

    return isLoading
        ? Loader()
        : Column(
            children: [
              if (connectedUser != null)
                ConnectedUserRank(
                  connectedUser: connectedUser,
                ),
              Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: () => getNationalRanking(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemBuilder: (_, int index) => NationalRankingLine(
                          user: nationalRanking[index],
                          index: index,
                        ),
                        separatorBuilder: (_, __) => Divider(
                          thickness: 1,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                        itemCount: nationalRanking.length,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
