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
  }
}
