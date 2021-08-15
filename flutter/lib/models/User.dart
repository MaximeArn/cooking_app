import 'package:cooking/models/Post.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  int age;
  String name;
  String email;
  String password;
  ImageProvider avatar;
  final List<Post> posts;
  final int stars;
  final int subscribers;
  final int subscriptions;

  User({
    required this.id,
    required this.age,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.posts,
    required this.stars,
    required this.subscribers,
    required this.subscriptions,
  });

  void setHashedPassword(String password) {
    //pass hashed password
    this.password = password;
  }

  User.fromJson(Map<String, dynamic> json, {bool isPopulated = true})
      : id = json["_id"],
        age = json["age"],
        name = json["name"],
        email = json["email"],
        password = json["password"],
        avatar = NetworkImage(json["avatar"]),
        posts = isPopulated
            ? (json["posts"] as List).map((jsonPost) {
                return Post.fromJson(
                  jsonPost,
                  isPopulated: false,
                );
              }).toList()
            : [],
        stars = json["stars"],
        subscribers = json["subscribers"],
        subscriptions = json["subscriptions"];
}
