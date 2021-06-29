import 'dart:convert';

import 'package:cooking/environment/env.dart';
import 'package:http/http.dart' as http;
import 'package:cooking/models/Post.type.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String avatar;
  final List<Post> posts;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.posts,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        name = json["name"],
        email = json["email"],
        password = json["password"],
        avatar = json["avatar"],
        posts = (json["posts"] as List)
            .map((jsonPost) => Post.fromJson(jsonPost))
            .toList();

  Future<User> getById(String userId) async {
    http.Response response =
        await http.get(Uri.parse("$serverUrl/user/$userId"));
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return User.fromJson(decodedBody);
    }
  }
}
