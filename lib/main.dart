import 'package:flutter/material.dart';
import 'package:flutterclass13/views/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentindex = 0;
  var _currenttab = [StudentBody(), StudentBody(), StudentBody(),StudentBody()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _currenttab[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Student"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Student"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Student"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Student"),
                backgroundColor: Colors.blue),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
      ),
    );
  }
}
