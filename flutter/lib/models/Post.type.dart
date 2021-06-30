import 'package:cooking/models/Comment.dart';
import 'package:cooking/models/User.dart';

class Post {
  final String id;
  final Map<String, String> author;
  final String image;
  final int note;
  final String description;
  List<Comment> comments = [];

  Post({
    required this.id,
    required this.author,
    required this.image,
    required this.note,
    required this.description,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        // author = json["author"],
        author = {
          "name": "Djibril",
          "avatar": "http://localhost:4545/assets/images/avatars/profile_photo_1.jpg",
        },
        image = json["image"],
        note = json["note"] == null ? 0 : json["note"],
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
