import 'package:flutter/material.dart';

class PostCardFooter extends StatelessWidget {
  final int note;
  final void Function(String, int) notePost;
  final String id;

  PostCardFooter(
      {required this.note, required this.notePost, required this.id});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return IconButton(
            icon: Icon(
              index < note ? Icons.star : Icons.star_border,
              color: Color.fromRGBO(232, 196, 81, 1),
              size: 30,
            ),
            onPressed: () {
              notePost(id, index + 1);
            },
          );
        }),
      ),
    );
  }
}
