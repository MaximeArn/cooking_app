import 'package:cooking/widgets/searchBar/results_lines/classic_result.dart';
import 'package:cooking/widgets/searchBar/results_lines/selectable_result.dart';
import 'package:flutter/material.dart';

class FullPageResults extends StatelessWidget {
  final List<Map<String, dynamic>> filteredUsers;
  final VoidCallback clearTextField;
  final bool addMembersPage;

  FullPageResults({
    required this.filteredUsers,
    required this.clearTextField,
    this.addMembersPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> user = filteredUsers[index];
        return addMembersPage
            ? SelectableResult(
                user: user,
              )
            : ClassicResult(user: user, clearTextField: clearTextField);
      },
    );
  }
}
