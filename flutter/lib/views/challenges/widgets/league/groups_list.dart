import 'package:cooking/providers/users.dart';
import 'package:cooking/views/challenges/widgets/league/group_list_row.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsList extends StatelessWidget {
  static String routeName = "/groupsList";
  const GroupsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<UsersProvider>(context, listen: false)
        .connectedUser
        ?.groups;
    print(groups?.length);

    return SecondaryScaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(7),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 15,
                    ),
                    label: Text(
                      "New group",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    )),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                GroupListRow(),
                GroupListRow(),
                GroupListRow(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
