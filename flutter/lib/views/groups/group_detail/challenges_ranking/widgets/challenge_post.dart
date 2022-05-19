import 'package:carousel_slider/carousel_slider.dart';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Post.dart';
import 'package:cooking/views/feed/widgets/post_card/post_card_header.dart';
import 'package:flutter/material.dart';

class ChallengePost extends StatelessWidget {
  final Post post;

  const ChallengePost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                children: [
                  PostCardHeader(
                    author: post.author,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(viewportFraction: 1),
              items: post.images
                  .map((image) => Container(
                        child: Image.network(
                          "$assetsUrl/$image",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
