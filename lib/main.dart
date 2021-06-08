import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "homepage",
      home: Scaffold(
        appBar: AppBar(title: Text("CooKing")),
        body: Container(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(onPressed: () {}, child: Text("I am a button ")),
              ElevatedButton(
                  onPressed: () {}, child: Text("I am an elevated button "))
            ])),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: "vote"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "rewards"),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: "post"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "ranking"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "profile"),
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    child: Center(child: Text("Menu")),
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 30, top: 30),
              child: Row(
                children: [Icon(Icons.supervised_user_circle), Text("Profile")],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [Icon(Icons.subway_rounded), Text("subway")],
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
