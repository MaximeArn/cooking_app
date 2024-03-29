import 'package:cooking/environment/env.dart';
import 'package:cooking/themes.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatar;
  final int stars;
  final int subscribers;
  final int subscriptions;

  ProfileHeader({
    required this.name,
    required this.avatar,
    required this.stars,
    required this.subscribers,
    required this.subscriptions,
  });

  @override
  Widget build(BuildContext context) {
    Future showImage() => showDialog(
          barrierColor: Color.fromRGBO(0, 0, 0, .7),
          context: context,
          builder: (_) => Dialog(
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundImage: NetworkImage(assetsUrl + avatar),
                radius: MediaQuery.of(context).size.width * (1 / 3),
              )),
        );

    return Flexible(
      flex: 35,
      child: Container(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      color: cookingGold,
                      border: Border(bottom: BorderSide(width: 1))),
                  padding: const EdgeInsets.only(top: 35),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              stars.toString(),
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(232, 196, 81, .7)),
                            ),
                            const Text(
                              "Etoiles",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              subscribers.toString(),
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(232, 196, 81, .7)),
                            ),
                            const Text(
                              "Abonnés",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              subscriptions.toString(),
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(232, 196, 81, .7)),
                            ),
                            const Text(
                              "Abonnements",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 46,
              backgroundColor: Colors.black,
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(assetsUrl + avatar),
                ),
                onTap: () {
                  showImage();
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
