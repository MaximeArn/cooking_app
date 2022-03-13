import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  static showSnackBar({String? text, isError = true}) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: isError ? Colors.red : Colors.green,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showLoader() async {
     await showDialog(
      context: navigatorKey.currentContext as BuildContext,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
