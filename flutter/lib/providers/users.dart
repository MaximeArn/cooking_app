import 'dart:collection';
import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider with ChangeNotifier {
  bool isLoading = false;
  List<Map<String, dynamic>> _filteredUsers = [];
  bool firstSearch = true;

  UnmodifiableListView<Map<String, dynamic>> get filteredUsers =>
      UnmodifiableListView(_filteredUsers);

  void emptyArray() {
    _filteredUsers.clear();
    notifyListeners();
  }

  Future<dynamic> getUserById(String userId) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$serverUrl/users/$userId"));
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getFilteredUsers(String filter, [String? bla]) async {
    isLoading = true;
    late http.Response response;
    // the filter must not be empty and it must either be the first search or that there are already results so as not to continue to search if no user matches with the filter.
    if (filter.isNotEmpty && (firstSearch || _filteredUsers.isNotEmpty)) {
      response = await http.get(
        Uri.parse("$serverUrl/users/search/$filter"),
      );
      if (response.statusCode == 200) {
        final List decodedBody = json.decode(response.body);
        _filteredUsers =
            (decodedBody).map((userJson) => {
              "name": userJson["name"],
              "avatar": userJson["avatar"],
              "id": userJson["_id"],
            }).toList();
        // after making the request "firstSearch" is now false.
        firstSearch = false;
      }
    } else {
      emptyArray();
    }
    if (filter.isEmpty) {
      // when the user deletes his search, we return firstSearch to true
      firstSearch = true;
    }
    notifyListeners();
    isLoading = false;
  }
}
