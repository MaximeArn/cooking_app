import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostCardImage extends StatelessWidget {
  final String photo;

  PostCardImage({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Row(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1
              ),
              items: [photo, photo, photo]
                  .map(
                    (image) => Image(image: NetworkImage(image), fit: BoxFit.cover,)
                  )
                  .toList(),
            ),
            // child: Ink.image(
            //   image: NetworkImage(photo),
            //   fit: BoxFit.cover,
            //   child: InkWell(
            //     borderRadius: const BorderRadius.all(Radius.circular(5)),
            //     onTap: () {
            //       print("image tapped");
            //     },
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
