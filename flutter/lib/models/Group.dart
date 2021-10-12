class Group {
  final String? name;
  final String? id;
  final List members;

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

  Group.fromJson(json, {bool isPopulated = true})
      : id = json["_id"],
        name = json["name"],
        members = [];
}
