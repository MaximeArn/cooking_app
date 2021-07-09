import 'package:cooking/models/Comment.dart';

class Post {
  final String id;
  final String authorId; 
  final Map<String, String> author;
  final List<String> images;
  final int note;
  final String description;
  List<Comment> comments = [];

  Post({
    required this.id,
    required this.authorId,
    required this.author,
    required this.images,
    required this.note,
    required this.description,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        authorId = json["authorId"],
        author = {
          "name": "Djibril",
          "avatar":
              "http://localhost:4545/assets/images/avatars/profile_photo_1.jpg",
        },
        images = List<String>.from(json["images"]),
        note = json["note"] == null ? 0 : json["note"],
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
