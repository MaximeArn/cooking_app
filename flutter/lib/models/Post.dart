import 'package:cooking/models/Comment.dart';

class Post {
  final String id;
  final Map<String, String> author;
  final List<String> image;
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
        author = {
          "name": "Djibril",
          "avatar":
              "http://localhost:4545/assets/images/avatars/profile_photo_1.jpg",
        },
        image =  List<String>.from(json["image"]),
        note = json["note"] == null ? 0 : json["note"],
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
