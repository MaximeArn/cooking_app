import 'package:cooking/models/User.dart';

class Group {
  final String? name;
  final String? id;
  final List<User>? members;

  Group({
    required this.id,
    required this.members,
    required this.name,
  });

  Group.fromJson(json, {bool isPopulated = true})
      : id = json["_id"],
        name = json["name"],
        members = [];
}
