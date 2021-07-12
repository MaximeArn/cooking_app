import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/Profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User connectdUser =
        Provider.of<UsersProvider>(context, listen: false).connectedUser;
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ProfileHeader(name: connectdUser.name, avatar: connectdUser.avatar),
          UserPosts(posts: connectdUser.posts)
        ],
      ),
    );
  }
}
