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

  Future<void> getFilteredUsers(String filter) async {
    isLoading = true;
    http.Response response = await http.get(
      Uri.parse("$serverUrl/users/$filter"),
    );
    if (response.statusCode == 200) {
      final decodedBody = json.decode(response.body);
      _filteredUsers = (decodedBody as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
    }
    isLoading = false;
  }
}
