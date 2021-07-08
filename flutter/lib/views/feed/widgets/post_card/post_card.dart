import 'package:cooking/models/Post.dart';
import 'package:cooking/providers/posts.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card_footer.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card_header.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card_imagee.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          height: 350,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              PostCardHeader(
                  authorAvatar: post.author["avatar"] as String,
                  author: post.author["name"] as String),
              Divider(
                height: 30,
                color: const Color.fromRGBO(232, 196, 81, 1),
                thickness: .7,
              ),
              PostCardImage(photo: post.image),
              PostCardFooter(
                note: post.note,
                id: post.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
