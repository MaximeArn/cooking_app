import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Group.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupsProvider with ChangeNotifier {
  final Group newGroup = Group(id: null, members: [], name: null);

  void removeMember(memberId) {
    newGroup.members.removeWhere((member) {
      return memberId == member["id"];
    });
    notifyListeners();
  }

  void addMember(member) {
    final bool alreadyAdded = newGroup.members.contains(member);
    if (!alreadyAdded) {
      newGroup.members.add(member);
      notifyListeners();
    }
  }

  Future<Group> createGroup(
      {required Group group, required String connectedUserId}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$serverUrl/groups/$connectedUserId"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"members": group.members, "name": group.name}),
      );
      print(response.body);
      final newGroup = Group.fromJson(json.decode(response.body));
      return newGroup;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<Group> getGroupById({required String groupId}) async {
    try {
      print(groupId);
      http.Response response = await http.get(
        Uri.parse(
          "$serverUrl/groups/$groupId",
        ),
      );
      print(response.body);
      return groupId as Group;
    } catch (e) {
      rethrow;
    }
  }
}
