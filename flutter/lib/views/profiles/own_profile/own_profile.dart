import 'package:cooking/providers/users.dart';
import 'package:cooking/views/profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnProfile extends StatefulWidget {
  const OwnProfile({Key? key}) : super(key: key);

  @override
  _OwnProfileState createState() => _OwnProfileState();
}

class _OwnProfileState extends State<OwnProfile> {
  @override
  void initState() {
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    if (usersProvider.connectedUser == null) {
      usersProvider.getUserByEmail(email: firebase.FirebaseAuth.instance.currentUser!.email as String);
    }
    super.initState();
  }

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
                  subscribers: user.subscribers.length,
                  subscriptions: user.subscriptions.length,
                ),
                UserPosts(posts: user.posts)
              ],
            ),
          )
        : Loader();
  }
}
