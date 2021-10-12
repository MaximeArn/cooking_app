import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:cooking/widgets/searchBar/search_bar.dart';
import 'package:flutter/rendering.dart';

class AddMembers extends StatelessWidget {
  static const routeName = "/createGroup";
  const AddMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<User> selectedMembers = [
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_1.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_2.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_3.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_4.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_5.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
      User(
          id: "id",
          age: 3,
          name: "name",
          email: "email",
          password: "password",
          avatar: "$serverUrl/assets/images/avatars/profile_photo_1.jpg",
          posts: [],
          stars: 3,
          subscribers: [],
          subscriptions: [],
          countryCode: "countryCode",
          groups: []),
    ];

    return SecondaryScaffold(
      body: Container(
        child: Column(
          children: [
            if (selectedMembers.length > 0)
              Expanded(
                flex: 11,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: selectedMembers
                        .map((member) => GestureDetector(
                          onTap: (){},
                          child: CircleAvatar(
                                backgroundImage: NetworkImage(member.avatar),
                              ),
                        ))
                        .toList(),
                  ),
                ),
              ),
            Expanded(
              flex: 89,
              child: FeedSearchBar(
                isFullPage: true,
                addMembersPage: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
