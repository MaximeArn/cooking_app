import 'dart:collection';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider with ChangeNotifier {
  List<User> _filteredUsers = [];

  UnmodifiableListView<User> get filteredUsers =>
      UnmodifiableListView(_filteredUsers);

  Future<void> getFilteredUsers(String filter) async {
    print("filter : $filter");
    http.Response response = await http.get(
      Uri.parse("$serverUrl/users/$filter"),
    );
  }
}
