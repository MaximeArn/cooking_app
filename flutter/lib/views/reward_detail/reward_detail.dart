import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Reward.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class RewardDetail extends StatelessWidget {
  static const String routeName = '/rewardDetail';

  @override
  Widget build(BuildContext context) {
    Reward reward = ModalRoute.of(context)!.settings.arguments as Reward;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SecondaryScaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 250,
              width: deviceWidth,
              child: Image.network(
                "$serverUrl/${reward.image}",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reward.title,
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Voir le site"))
                ],
              ),
            ),
            Divider(
              height: 25,
              thickness: 1,
              indent: 0.25 * deviceWidth,
              endIndent: 0.25 * deviceWidth,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                reward.description,
                style: const TextStyle(fontSize: 18, wordSpacing: 1.5),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Purchase for ${reward.price} "),
              ),
            ),
          ],
        ),
      ),
    
  );
  }
}
