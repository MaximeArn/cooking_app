import 'package:cooking/models/Comment.dart';
import 'package:cooking/models/User.dart';

class Post {
  final String id;
  final User? author;
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

  Post.fromJson(Map<String, dynamic> json, {bool isPopulated = true})
      : id = json["_id"],
        author = isPopulated
            ? User.fromJson(
                json["authorId"],
                isPopulated: false
              )
            : null,
        images = List<String>.from(json["images"]),
        note = json["note"] == null ? 0 : json["note"],
        description = json["description"],
        comments = (json["comments"] as List)
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
}
