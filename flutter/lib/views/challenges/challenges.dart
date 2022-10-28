import 'package:cooking/views/challenges/widgets/friend/friend_list.dart';
import 'package:cooking/views/challenges/widgets/league/groups_list.dart';
import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 5,
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed(GroupsList.routeName),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/league_background.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 5,
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed(FriendsList.routeName),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/challenge_background.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
