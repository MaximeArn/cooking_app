import 'package:carousel_slider/carousel_slider.dart';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Post.dart';
import 'package:flutter/material.dart';

class ChallengePost extends StatelessWidget {
  final Post post;

  const ChallengePost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String capitalize(String string) =>
        string[0].toUpperCase() + string.substring(1);

    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              capitalize(post.author!["name"]),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(viewportFraction: 1),
            items: post.images
                .map((image) => Container(
                      child: Image.network(
                        "$serverUrl/$image",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
