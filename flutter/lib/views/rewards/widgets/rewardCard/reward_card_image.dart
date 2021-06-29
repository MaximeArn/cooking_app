import 'package:cooking/environment/env.dart';
import 'package:flutter/material.dart';

class RewardCardImage extends StatelessWidget {
  final String image;

  RewardCardImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      fit: FlexFit.tight,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Image.network(
          '$serverUrl/$image',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
