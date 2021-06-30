import 'package:cooking/models/Post.type.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_footer.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_header.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_imagee.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;
  // final void Function(String, int) notePost;

  // PostCard({required this.post, required this.notePost});
  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        height: 350,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            PostCardHeader(
              //must pass dynamic data
                authorAvatar: post.author["avatar"] as String, author: post.author["name"] as String),
            Divider(
              height: 30,
              color: Color.fromRGBO(
                232,
                196,
                81,
                1,
              ),
              thickness: .7,
            ),
            PostCardImage(photo: post.image),
            PostCardFooter(
              note: post.note,
              notePost: () => print('hello'),
              id: post.id,
            ),
          ],
        ),
      ),
    );
  }
}
