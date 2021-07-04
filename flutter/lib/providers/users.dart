import 'dart:collection';
import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider with ChangeNotifier {
  bool isLoading = false;
  List<User> _filteredUsers = [];

  UnmodifiableListView<User> get filteredUsers =>
      UnmodifiableListView(_filteredUsers);

  void emptyArray() {
    _filteredUsers.clear();
  }

  Future<void> getFilteredUsers(String filter) async {
    // print("filter --------------> $filter");
    print(filter.isEmpty);
    print(filter == "");
    isLoading = true;
    late http.Response response;
    if (filter.isNotEmpty) {
      response = await http.get(
        Uri.parse("$serverUrl/users/$filter"),
      );

      if (response.statusCode == 200) {
        final List decodedBody = json.decode(response.body);
        // print(decodedBody.toString());
        _filteredUsers =
            (decodedBody).map((userJson) => User.fromJson(userJson)).toList();
      }
    } else {
      emptyArray();
    }
    print("length : ${filteredUsers.length}");
    notifyListeners();
    isLoading = false;
  }
}
