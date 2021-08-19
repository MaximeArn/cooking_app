import 'dart:convert';
import 'dart:io';
import 'package:cooking/models/Post.dart';

class User {
  final String id;
  int age;
  String name;
  String email;
  String password;
  String avatar;
  final List<Post> posts;
  final int stars;
  final int subscribers;
  final int subscriptions;
  File? fileImage = null;

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

  User.fromJson(Map<String, dynamic> json, {bool isPopulated = true})
      : id = json["_id"],
        age = json["age"],
        name = json["name"],
        email = json["email"],
        password = json["password"],
        avatar = json["avatar"],
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

  String toJson() {
    final userJson = json.encode({
      "_id": this.id,
      "age": this.age,
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "avatar": this.avatar,
    });
    return userJson;
  }
}
