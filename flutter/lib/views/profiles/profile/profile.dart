import 'package:cooking/models/User.dart';
import 'package:cooking/views/profiles/widgets/profile_header.dart';
import 'package:cooking/views/profiles/widgets/user_posts.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";
  final bool isFullPage;

  const Profile({required this.isFullPage});

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return isFullPage
        ? SecondaryScaffold(
            body: Container(
              child: Column(
                children: [
                  ProfileHeader(name: user.name, avatar: user.avatar),
                  const UserPosts(),
                ],
              ),
            ),
          )
        : Container(
            child: Column(
              children: [
                ProfileHeader(name: user.name, avatar: user.avatar),
                const UserPosts(),
              ],
            ),
          );
  }
}
