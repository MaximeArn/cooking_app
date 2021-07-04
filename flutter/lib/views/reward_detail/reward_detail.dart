import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Reward.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class RewardDetail extends StatefulWidget {
  static const String routeName = '/rewardDetail';

  @override
  _RewardDetailState createState() => _RewardDetailState();
}

class _RewardDetailState extends State<RewardDetail> {
  late bool isBuying;

  @override
  void initState() {
    isBuying = false;
    super.initState();
  }

  void toggleIsBuying() {
    setState(() {
      isBuying = !isBuying;
    });
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Text(
                        reward.title,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Voir le site")),
                    )
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
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  reward.description,
                  style: const TextStyle(
                      fontSize: 18, wordSpacing: 1.5, height: 1.3),
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
              flex: 12,
              fit: FlexFit.tight,
              child: isBuying
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            onPressed: toggleIsBuying,
                            child: Text("Cancel"),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  BeveledRectangleBorder()),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade500),
                            ),
                          ),
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text("Confirm")))
                      ],
                    )
                  : Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: toggleIsBuying,
                        child: Text(
                          "Purchase for ${reward.price}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
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
