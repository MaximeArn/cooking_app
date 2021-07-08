import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostCardImage extends StatelessWidget {
  final List<String> images;

  PostCardImage({required this.images});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Row(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(viewportFraction: 1),
              items: images
                  .map((image) => Container(
                        color: Colors.red,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
