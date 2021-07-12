import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  const UserPosts();

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
                  children: List.generate(
                      12,
                      (index) => Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            child: Text(index.toString()),
                          )).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
