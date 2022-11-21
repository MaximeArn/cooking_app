import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:cooking/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupsProvider with ChangeNotifier {
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
    try {
      http.Response response = await http.patch(
        Uri.parse("$serverUrl/groups/challenge"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"groupId": groupId, "title": title}),
      );
      print(response.body);
      if (response.statusCode == 500) {
        Utils.showSnackBar(isError: true, text: response.body);
      } else {
        // TODO: suite de la methode
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
