import 'package:cooking/views/Profiles/widgets/profile_header.dart';
import 'package:cooking/views/Profiles/widgets/user_posts.dart';
import 'package:flutter/material.dart';

class OwnProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileHeader(name: 'hello', avatar: "heyy"),
          UserPosts(),
        ],
      ),
    );
  }
}
