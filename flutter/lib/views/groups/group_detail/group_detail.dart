import 'package:cooking/models/Group.dart';
import 'package:cooking/views/groups/group_detail/challenges/challenges.dart';
import 'package:cooking/views/groups/group_detail/challenges_ranking/challenges_ranking.dart';
import 'package:cooking/views/groups/group_detail/group_settings/group_settings.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class GroupDetail extends StatelessWidget {
  static const routeName = "/groupDetail";
  const GroupDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;

    return SecondaryScaffold(
      action: IconButton(
        onPressed: () => Navigator.pushNamed(context, GroupSettings.routeName),
        icon: Icon(Icons.settings_rounded),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          child: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.black54,
                labelColor: Theme.of(context).highlightColor,
                indicatorColor: Theme.of(context).highlightColor,
                indicatorWeight: 2.5,
                tabs: [
                  Tab(
                    child: Text("Challenges"),
                  ),
                  Tab(
                    child: Text("Ranking"),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    Challenges(),
                    ChallengesRanking(group: group,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
