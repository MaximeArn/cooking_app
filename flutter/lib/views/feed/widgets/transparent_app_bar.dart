// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cooking/views/feed/widgets/toggle_feed_btns.dart';

class TransparentAppBar extends StatelessWidget {
  final int currentTabIndex;
  final Function(int index) onTabPressed;
  final Function() onDrawerPressed;
  final Function() onSearchPressed;

  const TransparentAppBar({
    Key? key,
    required this.currentTabIndex,
    required this.onTabPressed,
    required this.onDrawerPressed,
    required this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _getIcon("drawer", Icons.menu),
        const Spacer(),
        ToggleFeedBtns(
            currentIndex: currentTabIndex, onTabPressed: onTabPressed),
        const Spacer(),
        _getIcon("search", Icons.search),
      ],
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _getIcon(String tag, IconData icon) =>
      IconButton(onPressed: () => _onIconTap(tag), icon: Icon(icon, size: 30));

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onIconTap(String tag) {
    switch (tag) {
      case "drawer":
        onDrawerPressed();
        break;
      case "search":
        onSearchPressed();
        break;
    }
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////
}
