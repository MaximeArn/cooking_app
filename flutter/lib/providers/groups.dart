import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';

class GroupsProvider with ChangeNotifier {
  final Group newGroup = Group(
      id: null,
      members: [
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
      ],
      name: null);

  Future<void> createGroup() async {}
}
