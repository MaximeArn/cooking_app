class Comment {
  final String content;
  final String author;

  Comment({required this.content, required this.author});

  Comment.fromJson(Map<String, dynamic> json)
      : content = json["content"],
        author = json["author"];
}
