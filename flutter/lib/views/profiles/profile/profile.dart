import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    final String userId = ModalRoute.of(context)!.settings.arguments as String;
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    return SecondaryScaffold(
        body: FutureBuilder(
      future: usersProvider.getUserById(userId),
      builder: (builder, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          final User user = snapshot.data as User;
          return Container(
            padding: EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                ProfileHeader(
                  name: user.name,
                  avatar: user.avatar,
                  stars: user.stars,
                  subscribers: user.subscribers,
                  subscriptions: user.subscriptions,
                ),
                UserPosts(
                  posts: user.posts,
                ),
              ],
            ),
          );
        } else {
          return Loader();
        }
      },
    ));
  }
}
