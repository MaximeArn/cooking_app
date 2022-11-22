import 'package:cooking/models/Post.dart';

class Challenge {
  final String title;
  final String status;
  final List<dynamic> posts;

  Challenge({required this.title, required this.status, required this.posts});

  Challenge.fromJson(json, {bool isPopulated = false})
      : status = json["status"],
        title = json["title"],
        posts = isPopulated
            ? json["posts"]
                .map((postJson) => Post.fromJson(postJson, isPopulated: true))
                .toList()
            : [];
}
