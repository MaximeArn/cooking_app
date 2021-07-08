import 'package:flutter/material.dart';

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
            child: Ink.image(
              image: NetworkImage(photo),
              fit: BoxFit.cover,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                onTap: () {
                  print("image tapped");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
