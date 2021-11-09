import 'package:cooking/models/Challenge.dart';

class Group {
  String? name;
  final String? id;
  final List<dynamic> members;
  final List challenges;

  Group({
    required this.id,
    required this.members,
    required this.name,
    required this.challenges,
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
        members = json["members"],
        challenges = isPopulated
            ? json["challenges"]
                .map((challengeJson) =>
                    Challenge.fromJson(challengeJson, isPopulated: true))
                .toList()
            : json["challenges"];
}
