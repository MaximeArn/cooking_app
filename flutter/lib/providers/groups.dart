import 'package:cooking/models/Group.dart';
import 'package:flutter/material.dart';

class GroupsProvider with ChangeNotifier {
  final Group newGroup = Group(id: null, members: [], name: null);

  void removeMember(memberId) {
    newGroup.members.removeWhere((member) {
      print(member);
      return memberId == member["id"];
    });
    notifyListeners();
  }

  void addMember(member) {
    newGroup.members.add(member);
    notifyListeners();
  }

  Future<void> createGroup() async {}
}
