import 'package:cooking/models/Challenge.dart';

class Group {
  String? title;
  final String? id;
  final List<dynamic> members;
  final List challenges;
  final String avatar;

  Group(
      {required this.id,
      required this.members,
      required this.title,
      required this.challenges,
      required this.avatar});

  addMember(member) {
    this.members.add(member);
  }

  removeMember(memberId) {
    this.members.removeWhere((member) {
      return memberId == member.id;
    });
  }

  setName(String newName) {
    this.title = newName;
  }

  Group.fromJson(json, {bool isPopulated = false})
      : id = json["_id"],
        title = json["title"],
        members = json["members"],
        avatar = json["avatar"],
        challenges = isPopulated
            ? json["challenges"]
                .map((challengeJson) =>
                    Challenge.fromJson(challengeJson, isPopulated: true))
                .toList()
            : [];
}
