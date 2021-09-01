import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnProfile extends StatefulWidget {
  const OwnProfile({Key? key}) : super(key: key);

  @override
  _OwnProfileState createState() => _OwnProfileState();
}

class _OwnProfileState extends State<OwnProfile> {
  @override
  Widget build(BuildContext context) {
    // final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final User? user = Provider.of<UsersProvider>(context).connectedUser;

    return user != null
        ? Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                ProfileHeader(
                  name: user.name,
                  avatar: user.avatar,
                  stars: user.stars,
                  subscribers: user.subscribers,
                  subscriptions: user.subscriptions,
                ),
                UserPosts(posts: user.posts)
              ],
            ),
          )
        : Loader();

    // return FutureBuilder(
    //   future: usersProvider.getConnectedUser("60e8c2140e7c9296fa2380c3"),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasError) {
    //       return Text(snapshot.error.toString());
    //     } else if (snapshot.hasData) {
    //       return Container(
    //         padding: EdgeInsets.only(bottom: 10),
    //         child: Column(
    //           children: [
    //             ProfileHeader(
    //               name: snapshot.data.name,
    //               avatar: snapshot.data.avatar,
    //               stars: snapshot.data.stars,
    //               subscribers: snapshot.data.subscribers,
    //               subscriptions: snapshot.data.subscriptions,
    //             ),
    //             UserPosts(posts: snapshot.data.posts)
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Loader();
    //     }
    //   },
    // );
  }
}
