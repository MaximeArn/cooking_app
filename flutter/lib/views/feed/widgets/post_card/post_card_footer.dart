import 'package:cooking/providers/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PostCardFooter extends StatelessWidget {
  final int note;
  final String id;
  late void Function(String, int) notePost;

  PostCardFooter({required this.note, required this.id});

  @override
  Widget build(BuildContext context) {
    notePost = Provider.of<PostsProvider>(context).notePost;
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return IconButton(
              icon: Icon(
                index < note ? Icons.star : Icons.star_border,
                color: Color.fromRGBO(232, 196, 81, 1),
                size: 30,
              ),
              onPressed: () {
                if (note != (index + 1)) notePost(id, index + 1);
              },
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment_rounded),
                iconSize: 25,
                color: Color.fromRGBO(232, 196, 81, 1),
              ),
            )
          ],
        )
      ]),
    );
  }
}
