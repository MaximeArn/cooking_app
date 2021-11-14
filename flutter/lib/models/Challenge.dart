import 'package:cooking/models/Post.dart';

class Challenge {
  final String theme;
  final bool isActive;
  final List<dynamic> posts;

  Challenge({required this.theme, required this.isActive, required this.posts});

  Challenge.fromJson(json, {bool isPopulated = false}):
    isActive = json["isActive"] == "true" ? true : false,
    theme = json["theme"],
    posts = isPopulated 
      ? json["posts"].map((postJson) => Post.fromJson(postJson)).toList() 
      : [];
}
