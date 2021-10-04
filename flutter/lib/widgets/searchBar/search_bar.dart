import 'package:cooking/providers/users.dart';
import 'package:cooking/widgets/searchBar/full_page_results.dart';
import 'package:cooking/widgets/searchBar/results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FeedSearchBar extends StatefulWidget {
  late bool isFullPage;
  final bool addMembersPage;

  FeedSearchBar({required this.isFullPage, this.addMembersPage = false});

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

  void fetchFilteredUsers(filter, {searchAmoungFriends}) {
    Provider.of<UsersProvider>(context, listen: false)
        .getFilteredUsers(filter, searAmoungFriends: searchAmoungFriends);
  }

  void clearTextField() {
    searchBarController.clear();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredUsers =
        Provider.of<UsersProvider>(context).filteredUsers;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(232, 196, 81, .7),
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    fetchFilteredUsers(text,
                        searchAmoungFriends: widget.addMembersPage);
                  },
                  autocorrect: false,
                  controller: searchBarController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: const Icon(
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
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        if (filteredUsers.length > 0)
          widget.isFullPage
              ? FullPageResults(
                  addMembersPage: widget.addMembersPage,
                  filteredUsers: filteredUsers,
                  clearTextField: clearTextField)
              : ResultsList(
                  filteredUsers: filteredUsers, clearTextField: clearTextField)
      ],
    );
  }
}
