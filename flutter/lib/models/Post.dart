import 'package:cooking/models/Comment.dart';

class Post {
  final String id;
  final Map<String, String> author;
  final List<String> images;
  int note;
  final String description;
  List<Comment> comments = [];

  Post({
    required this.id,
    required this.author,
    required this.images,
    required this.note,
    required this.description,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        author = {
          "name" : json["authorId"]["name"],
          "avatar" : json["authorId"]["avatar"],
          "id": json["authorId"]["_id"],
        },
        images = List<String>.from(json["images"]),
        // note = json["note"] == null ? 0 : json["note"],
        note = 3,
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
