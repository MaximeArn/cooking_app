import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CapturedPicturesThumbnail extends StatelessWidget {
  final List lastCapturedPictures;

  const CapturedPicturesThumbnail(
      {Key? key, required this.lastCapturedPictures})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (lastCapturedPictures.isNotEmpty) {
          showDialog(
              barrierColor: Colors.black38,
              context: context,
              builder: (_) =>
                  CarouselPreview(lastCapturedPictures: lastCapturedPictures));
        }
      }),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white, width: 2),
          image: lastCapturedPictures.isNotEmpty
              ? DecorationImage(
                  image: FileImage(lastCapturedPictures.last),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}

class CarouselPreview extends StatelessWidget {
  final List lastCapturedPictures;

  const CarouselPreview({Key? key, required this.lastCapturedPictures})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: CarouselSlider(
        items: lastCapturedPictures.map((file) => Image.file(file)).toList(),
        options: CarouselOptions(
          aspectRatio: 4 / 5,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
