import 'package:cooking/environment/env.dart';
import 'package:cooking/providers/groups.dart';
import 'package:cooking/providers/users.dart';
import 'package:cooking/views/groups/group_detail/group_detail.dart';
import 'package:flutter/material.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:cooking/widgets/searchBar/search_bar.dart';
import 'package:provider/provider.dart';

class AddMembers extends StatefulWidget {
  static const routeName = "/addMembers";
  const AddMembers({Key? key}) : super(key: key);

  @override
  _AddMembersState createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  @override
  Widget build(BuildContext context) {
    final removeMember = Provider.of<GroupsProvider>(context).removeMember;
    final newGroup = Provider.of<GroupsProvider>(context).newGroup;
    final List selectedMembers =
        Provider.of<GroupsProvider>(context).newGroup.members;
    final connectedUser = Provider.of<UsersProvider>(context).connectedUser;

    return SecondaryScaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).highlightColor,
              child: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {
                Provider.of<UsersProvider>(context, listen: false).emptyArray();
                GroupsProvider()
                    .createGroup(
                  group: newGroup,
                  connectedUserId: connectedUser!.id,
                )
                    .then((newGroup) {
                  Provider.of<UsersProvider>(context, listen: false)
                      .getConnectedUserGroups(connectedUser.id);
                  Navigator.popAndPushNamed(
                    context,
                    GroupDetail.routeName,
                    arguments: newGroup,
                  );
                });
              },
            ),
          ),
          Container(
            child: Column(
              children: [
                if (selectedMembers.length > 0)
                  Expanded(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        children: selectedMembers
                            .map(
                              (member) => GestureDetector(
                                onTap: () {
                                  removeMember(member["id"]);
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      assetsUrl + member["avatar"]),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 89,
                  child: FeedSearchBar(
                    isFullPage: true,
                    addMembersPage: true,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
