import 'package:cooking/views/feed/feed.dart';
import 'package:cooking/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not Found'),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, Feed.routeName),
                child: Text("Homepage"))
          ],
        ),
      ),
    );
  }
}
