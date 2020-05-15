import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterclass13/views/page1.dart';
import 'package:flutterclass13/views/page2.dart';
import 'package:flutterclass13/views/page3.dart';
import 'package:flutterclass13/views/page4.dart';

void main() => runApp(MyApp());

/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentindex = 0;
  var _currenttab = [BookBody(), EmpBody(), PdtBody(),StudentBody()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _currenttab[_currentindex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark),
                title: Text("Book"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Employee"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Product"),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.airport_shuttle),
                title: Text("Student"),
                backgroundColor: Colors.purple),
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
*/

//Alternate
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController t;

  void initState() {
    super.initState();
    t = TabController(length: 4, vsync: this);
  }

  void dispose() {
    t.dispose();
    super.dispose();
  }

  var col=Colors.blue;
  var i = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          child: Container(
            child: TabBarView(
              children: <Widget>[
                BookBody(),
                EmpBody(),
                PdtBody(),
                StudentBody()
              ],
              controller: t,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: col,
          child: Material(
            color: col,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text("Book"),
                  icon: Icon(Icons.collections_bookmark),
                ),
                Tab(
                  child: Text("Employee"),
                  icon: Icon(Icons.perm_identity),
                ),
                Tab(
                  child: Text("Product"),
                  icon: Icon(Icons.shopping_cart),
                ),
                Tab(
                  child: Text("Student"),
                  icon: Icon(Icons.airport_shuttle),
                ),
              ],
              controller: t,
              onTap: (t) {
                i = t;
                setState(() {
                  if (i == 0)
                    col = Colors.blue;
                  else if (i == 1)
                    col = Colors.red;
                  else if (i == 2)
                    col = Colors.green;
                  else
                    col = Colors.purple;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
