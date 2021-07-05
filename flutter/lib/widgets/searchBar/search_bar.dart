import 'package:cooking/models/User.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/widgets/searchBar/full_page_results.dart';
import 'package:cooking/widgets/searchBar/results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedSearchBar extends StatefulWidget {
  late bool isFullPage;

  FeedSearchBar({required this.isFullPage});

  @override
  _FeedSearchBarState createState() => _FeedSearchBarState();
}

class _FeedSearchBarState extends State<FeedSearchBar> {
  TextEditingController searchBarController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  void fetchFilteredUsers(filter) {
    Provider.of<UsersProvider>(context, listen: false).getFilteredUsers(filter);
  }

  @override
  Widget build(BuildContext context) {
    List<User> filteredUsers =
        Provider.of<UsersProvider>(context).filteredUsers;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(232, 196, 81, .7),
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    fetchFilteredUsers(text);
                  },
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
                  fetchFilteredUsers("");
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        if (filteredUsers.length > 0)
          widget.isFullPage
              ? FullPageResults(filteredUsers: filteredUsers)
              : ResultsList(filteredUsers: filteredUsers)
      ],
    );
  }
}
