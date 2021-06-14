import 'package:cooking/models/Post.type.dart';
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
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(post.authorAvatar),
                        ),
                      ),
                      Text(
                        post.author,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
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
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Ink.image(
                        image: AssetImage(post.photo),
                        fit: BoxFit.cover,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          onTap: () {
                            print("image tapped");
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Vote : ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    IconButton(
                        onPressed: () {
                          print("1 star");
                        },
                        icon: Icon(Icons.star_border)),
                        IconButton(
                        onPressed: () {
                          print("2 star");
                        },
                        icon: Icon(Icons.star_border)),
                        IconButton(
                        onPressed: () {
                          print("3 star");
                        },
                        icon: Icon(Icons.star_border)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
