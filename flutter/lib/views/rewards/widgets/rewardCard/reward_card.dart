import 'package:cooking/models/Reward.dart';
import 'package:cooking/views/reward_detail/reward_detail.dart';
import 'package:cooking/views/rewards/widgets/rewardCard/reward_card_image.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 5,
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RewardCardImage(image: reward.image),
              Flexible(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          reward.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: reward.price.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18)),
                              const WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.0,
                                  ),
                                  child: Icon(
                                    Icons.star,
                                    size: 50,
                                    color: Color.fromRGBO(
                                      232,
                                      196,
                                      81,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    child: Text(
                      "read more -->",
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, RewardDetail.routeName,
                        arguments: reward),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
