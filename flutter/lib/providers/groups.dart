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

  Future<void> createGroup() async {
    http.Response response = await http.post(Uri.parse("$serverUrl/groups"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          "members": newGroup.members,
          "name": newGroup.name
        }));
    print(response);
  }
}
