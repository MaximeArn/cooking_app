import 'package:cooking/models/User.dart';

class Group {
  String? name;
  final String? id;
  final List<dynamic> members;

  Group({
    required this.id,
    required this.members,
    required this.name,
  });

  addMember(member) {
    this.members.add(member);
  }

  removeMember(memberId) {
    this.members.removeWhere((member) {
      return memberId == member.id;
    });
  }

  setName(String newName) {
    this.name = newName;
  }

  Group.fromJson(json, {bool isPopulated = false})
      : id = json["_id"],
        name = json["name"],
        members = isPopulated
            ? json["members"]
                .map((memberJson) => User.fromJson(memberJson))
                .toList()
            : json["members"];
}
