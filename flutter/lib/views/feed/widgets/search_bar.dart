import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedSearchBar extends StatefulWidget {
  const FeedSearchBar({Key? key}) : super(key: key);

  @override
  _FeedSearchBarState createState() => _FeedSearchBarState();
}

class _FeedSearchBarState extends State<FeedSearchBar> {
  TextEditingController searchBarController = TextEditingController();

  @override
  void initState() {
    searchBarController.addListener(
      () {
        setState(() {
          Provider.of<UsersProvider>(context, listen: false)
              .getFilteredUsers(searchBarController.text);
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<User> filteredUsers =
        Provider.of<UsersProvider>(context).filteredUsers;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  autocorrect: false,
                  controller: searchBarController,
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
                onPressed: () {
                  searchBarController.clear();
                },
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
        ),
        filteredUsers.length > 0
            ? Column(
                children: filteredUsers
                    .map((user) => Card(
                            child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(user.name),
                        )))
                    .toList(),
              )
            : Text("no results")
      ],
    );
  }
}
