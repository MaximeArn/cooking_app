import 'package:cooking/models/User.dart';

class Group {
  final String name;
  final String id;
  final List<User> users;

  Group({
    required this.id,
    required this.users,
    required this.name,
  });

  Group.fromJson(json, {bool isPopulated = true})
      : id = json["_id"],
        name = json["name"],
        users = [];
}
