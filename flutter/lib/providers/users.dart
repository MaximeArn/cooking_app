import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class UsersProvider with ChangeNotifier {
  bool isLoading = false;
  List<Map<String, dynamic>> _filteredUsers = [];
  bool firstSearch = true;
  User? connectedUser = null;

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

  Future<dynamic> getConnectedUser(String userId,
      [bool refresh = false]) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$serverUrl/users/$userId"));
      if (response.statusCode == 200) {
        User user = User.fromJson(json.decode(response.body));
        connectedUser = user;
        if (refresh) {
          notifyListeners();
        }
        return user;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getFilteredUsers(String filter) async {
    isLoading = true;
    late http.Response response;
    // the filter must not be empty and it must either be the first search or that there are already results so as not to continue to search if no user matches with the filter.
    if (filter.isNotEmpty && (firstSearch || _filteredUsers.isNotEmpty)) {
      response = await http.get(
        Uri.parse("$serverUrl/users/search/$filter"),
      );
      if (response.statusCode == 200) {
        final List decodedBody = json.decode(response.body);
        _filteredUsers = (decodedBody)
            .map((userJson) => {
                  "name": userJson["name"],
                  "avatar": userJson["avatar"],
                  "id": userJson["_id"],
                })
            .toList();
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

  Future<void> updateUser({
    required String name,
    required String email,
    required String age,
    required String pwd,
  }) async {
    File? avatar = connectedUser!.fileImage;
    if (avatar != null) {
      print(avatar.path);
      try {
        http.MultipartRequest request = http.MultipartRequest(
            "POST", Uri.parse("$serverUrl/images/user/avatar"));

        request.files.add(
          http.MultipartFile.fromBytes(
            "profile",
            avatar.readAsBytesSync(),
            filename: basename(avatar.path),
            contentType: MediaType("multipart", "form-data"),
          ),
        );
      } catch (e) {
        rethrow;
      }
    }

    connectedUser!.name = name;
    connectedUser!.email = email;
    if (age.isNotEmpty) {
      connectedUser!.age = int.parse(age);
    }
    connectedUser!.password = pwd;

    String jsonUser = connectedUser!.toJson();

    try {
      http.Response response = await http.patch(
          Uri.parse(
            "$serverUrl/users/${connectedUser!.id}",
          ),
          headers: {'Content-type': 'application/json'},
          body: jsonUser);
      connectedUser = await getConnectedUser(connectedUser!.id, true);
    } catch (e) {
      rethrow;
    }
  }
}
