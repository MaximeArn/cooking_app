import 'package:cooking/widgets/bottom_navigation.dart';
import 'package:cooking/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidePanel(),
      // bottomNavigationBar: BottomNavigation(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not Found'),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/"),
                child: Text("Homepage"))
          ],
        ),
      ),
    );
  }
}
