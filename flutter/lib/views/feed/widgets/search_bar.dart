import 'package:flutter/material.dart';

class FeedSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          )
        ],
      ),
      color: Color.fromRGBO(
        232,
        196,
        81,
        .7,
      ),
    );
  }
}
