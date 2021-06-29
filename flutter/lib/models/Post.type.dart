class Post {
  final String author;
  final String authorAvatar;
  final String description;
  int note;
  final String photo;
  final String id;

  Post(
      {required this.author,
      required this.authorAvatar,
      required this.description,
      required this.note,
      required this.photo,
      required this.id});

  // set note(int newNote) {
  //   this.note = newNote;
  // }
}
