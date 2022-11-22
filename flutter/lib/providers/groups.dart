import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:cooking/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupsProvider with ChangeNotifier {
  bool isLoading = false;

  Future<dynamic> getGroupById({required String groupId}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$serverUrl/groups/$groupId",
        ),
      );
      final decodedBody = json.decode(response.body);
      final Group group = await Group.fromJson(decodedBody, isPopulated: true);
      return group;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<dynamic> createChallenge(
      {required String groupId, required String title}) async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.patch(
        Uri.parse("$serverUrl/groups/challenge"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"groupId": groupId, "title": title}),
      );
      if (response.statusCode == 500) {
        throw Exception(response.body);
      } else {
        isLoading = false;
        notifyListeners();
        return Group.fromJson(json.decode(response.body), isPopulated: true);
      }
    } catch (e) {
      Utils.showSnackBar(isError: true, text: e.toString());
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
