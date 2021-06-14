import 'package:cooking/models/Post.type.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_footer.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_header.dart';
import 'package:cooking/views/vote/widgets/post_card/post_card_imagee.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 350,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            PostCardHeader(
                authorAvatar: post.authorAvatar, author: post.author),
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
            PostCardImage(photo: post.photo),
            PostCardFooter(
              vote: post.note,
            ),
          ],
        ),
      ),
    );
  }
}
