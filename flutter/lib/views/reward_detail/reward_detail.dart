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
            Flexible(
              flex: 30,
              fit: FlexFit.tight,
              child: Container(
                width: deviceWidth,
                child: Image.network(
                  "$serverUrl/${reward.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 8,
               fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reward.title,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text("Voir le site"))
                  ],
                ),
              ),
            ),
            Divider(
              height: 25,
              thickness: 1,
              indent: 0.25 * deviceWidth,
              endIndent: 0.25 * deviceWidth,
            ),
            Flexible(
              flex: 50,
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Text(
                    reward.description,
                    style: const TextStyle(fontSize: 18, wordSpacing: 1.5, height: 1.3),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 12,
               fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Purchase for ${reward.price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
