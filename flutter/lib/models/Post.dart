import 'package:cooking/models/Comment.dart';

class Post {
  final String id;
  final Map<String, dynamic>? author;
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

  Post.fromJson(Map<String, dynamic> json, {bool isPopulated = false})
      : id = json["_id"],
        author = isPopulated
            ? {
                "name": json["author"]["name"],
                "avatar": json["author"]["avatar"],
                "id": json["author"]["_id"],
              }
            : null,
        images = List<String>.from(json["images"]),
        note = json["note"] == null ? 0 : json["note"],
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
