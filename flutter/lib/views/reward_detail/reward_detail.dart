import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Reward.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class RewardDetail extends StatelessWidget {
  static const String routeName = '/rewardDetail';

  @override
  Widget build(BuildContext context) {
    Reward reward = ModalRoute.of(context)!.settings.arguments as Reward;
    return SecondaryScaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network("$serverUrl/${reward.image}",fit: BoxFit.cover,),
              ),
              Row(
                children: [
                  Text(reward.title),
                  ElevatedButton(onPressed: (){}, child: Text("Visite site"))
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
