import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/Profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    // final User connectedUser = Provider.of<UsersProvider>(context);
    return FutureBuilder(
      future: usersProvider.fetchConnectedUser("60e8c2140e7c9296fa2380c3"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          print(snapshot.data);
          return Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
                    children: [
                      ProfileHeader(
                          name: snapshot.data.name,
                          avatar: snapshot.data.avatar),
                      UserPosts(posts: snapshot.data.posts)
                    ],
                  ),
          );
        }
      },
    );
  }
}
