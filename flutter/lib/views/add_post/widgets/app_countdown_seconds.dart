import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

import 'package:cooking/themes.dart';

class AppCountdownSeconds extends StatefulWidget {
  final int timerSeconds;
  final Function() callback;

  const AppCountdownSeconds({
    Key? key,
    required this.timerSeconds,
    required this.callback,
  }) : super(key: key);

  @override
  _AppCountdownSecondsState createState() => _AppCountdownSecondsState();
}

class _AppCountdownSecondsState extends State<AppCountdownSeconds> {
  late int _remaining;
  late PausableTimer _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.timerSeconds;
    _startTimer();
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(

        color: Colors.white38,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _remaining.toString(),
        style: TextStyle(
          color: cookingGold,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////

  void _startTimer() {
    _timer = PausableTimer(Duration(seconds: 1), () {
      if (_remaining > 1) {
        _remaining--;
        _timer
          ..reset()
          ..start();
      } else {
        widget.callback();
        _timer.cancel();
      }
      setState(() {});
    });
    _timer.start();
  }
}
