import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:cooking/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class UsersProvider with ChangeNotifier {
  bool isLoading = false;
  bool firstSearch = true;

  User? _connectedUser;
  User? get connectedUser => _connectedUser;
  void set connectedUser(User? user) {
    this._connectedUser = user;
    notifyListeners();
  }

  List<Map<String, dynamic>> _filteredUsers = [];
  UnmodifiableListView<Map<String, dynamic>> get filteredUsers =>
      UnmodifiableListView(_filteredUsers);

  List<Map<String, dynamic>> _nationalRanking = [];
  UnmodifiableListView<Map<String, dynamic>> get nationalRanking =>
      UnmodifiableListView(_nationalRanking);

  void emptyArray() {
    _filteredUsers.clear();
    notifyListeners();
  }

  Future<dynamic> getUserById(String userId) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$serverUrl/users/id/$userId"));
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        return User.fromJson(
          json.decode(response.body),
          isPopulated: true,
        );
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future getUserByEmail({required String email}) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$serverUrl/users/email/$email"));
      if (response.statusCode == 200) {
        connectedUser = User.fromJson(
          json.decode(response.body),
          isPopulated: true,
        );
        getConnectedUserGroups(connectedUser!.id);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getConnectedUserById(String userId) async {
    try {
      connectedUser = await getUserById(userId);
      getConnectedUserGroups(userId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getConnectedUserGroups(userId) async {
    http.Response response =
        await http.get(Uri.parse("$serverUrl/groups/getGroups/$userId"));
    final List decodedBody = json.decode(response.body);
    connectedUser!.groups = decodedBody
        .map((groupJson) => Group.fromJson(groupJson, isPopulated: false))
        .toList();
    notifyListeners();
  }

  Future<void> getFilteredUsers(String filter,
      {searAmoungFriends = false}) async {
    isLoading = true;
    late http.Response response;
    // the filter must not be empty and it must either be the first search or that there are already results so as not to continue to search if no user matches with the filter.
    if (filter.isNotEmpty && (firstSearch || _filteredUsers.isNotEmpty)) {
      response = await http.get(
        Uri.parse(searAmoungFriends
            ? "$serverUrl/users/searchAmoungFriends/$filter/${connectedUser!.id}"
            : "$serverUrl/users/search/$filter"),
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

  Future<void> uploadAvatar() async {
    File avatar = connectedUser!.fileImage as File;
    try {
      http.MultipartRequest request = http.MultipartRequest(
          "POST", Uri.parse("$serverUrl/images/user/avatar"));
      request.files.add(
        http.MultipartFile.fromBytes(
          "avatar",
          avatar.readAsBytesSync(),
          filename: basename(avatar.path),
          contentType: MediaType("multipart", "form-data"),
        ),
      );
      request.fields["oldAvatar"] = connectedUser!.avatar;

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        String decodedUrl = json.decode(String.fromCharCodes(responseData));
        connectedUser!.avatar = decodedUrl;
      } else {
        throw Exception("server error during image upload");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser({
    required String name,
    required String email,
    required String age,
    required String pwd,
  }) async {
    if (connectedUser!.fileImage != null) await uploadAvatar();

    connectedUser!.name = name;
    connectedUser!.email = email;
    connectedUser!.password = pwd;
    if (age.isNotEmpty) {
      connectedUser!.age = int.parse(age);
    }

    String jsonUser = connectedUser!.toJson();

    try {
      final http.Response response = await http.patch(
        Uri.parse(
          "$serverUrl/users/${connectedUser!.id}",
        ),
        headers: {'Content-type': 'application/json'},
        body: jsonUser,
      );
      connectedUser =
          User.fromJson(json.decode(response.body), isPopulated: true);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getNationalRanking([countryCode = "FR"]) async {
    isLoading = true;
    try {
      http.Response response = await http
          .get(Uri.parse("$serverUrl/users/ranking/national/$countryCode"));

      if (response.statusCode == 200) {
        final List decodedBody = json.decode(response.body);
        _nationalRanking = decodedBody
            .map((user) => {
                  "id": user["_id"],
                  "name": user["name"],
                  "avatar": user["avatar"],
                  "stars": user["stars"],
                })
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
