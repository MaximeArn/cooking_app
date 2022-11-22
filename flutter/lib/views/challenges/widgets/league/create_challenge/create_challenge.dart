import 'package:cooking/models/Group.dart';
import 'package:cooking/providers/groups.dart';
import 'package:cooking/views/challenges/widgets/league/create_challenge/group_header.dart';
import 'package:cooking/widgets/loader.dart';
import 'package:cooking/widgets/scaffolds/secondary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateChallenge extends StatefulWidget {
  static String routeName = "/createChallenge";
  const CreateChallenge({Key? key}) : super(key: key);

  @override
  State<CreateChallenge> createState() => _CreateChallengeState();
}

class _CreateChallengeState extends State<CreateChallenge> {
  bool isSubmitEnabled = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isSubmitEnabled = controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;
    final groupsProvider = Provider.of<GroupsProvider>(context);

    return SecondaryScaffold(
      body: Column(
        children: [
          GroupHeader(group: group),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
              "Challenge",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Write the theme of the challenge here :"),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        14,
                      ),
                    ),
                  ),
                  label: Center(
                    child: Text(
                      "ex : Broccoli Dessert",
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              textAlign: TextAlign.center,
            ),
          ),
          groupsProvider.isLoading
              ? Loader()
              : SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: isSubmitEnabled
                        ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(29, 29, 29, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                        : ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(1),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).scaffoldBackgroundColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                    onPressed: isSubmitEnabled
                        ? () {
                            groupsProvider.createChallenge(
                              groupId: group.id as String,
                              title: controller.value.text.trim(),
                            );
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            color: isSubmitEnabled
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: isSubmitEnabled
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
