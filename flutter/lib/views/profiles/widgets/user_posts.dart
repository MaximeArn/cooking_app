import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Post.dart';
import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final List<Post> posts;

  UserPosts({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 65,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Text(
                  "Mes Plats :",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: posts
                        .map(
                          (post) => Container(
                            child: Image.network(assetsUrl + post.images[0]),
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
