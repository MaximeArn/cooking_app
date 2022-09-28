// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cooking/themes.dart';
import 'package:flutter/material.dart';

class ToggleFeedBtns extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTabPressed;

  const ToggleFeedBtns({
    Key? key,
    required this.currentIndex,
    required this.onTabPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getTab(0, "vote"),
        const SizedBox(
          width: 8,
        ),
        _getTab(1, "coach"),
      ],
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _getTab(int index, String name) => InkWell(
        onTap: () => onTabPressed(index),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: (currentIndex == index)
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54)
              : BoxDecoration(),
          child: Text(
            name,
            style: TextStyle(
              color: (currentIndex == index) ? cookingGold : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

//////////////////////////////// FUNCTIONS ////////////////////////////////
}
