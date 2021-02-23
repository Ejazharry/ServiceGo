import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/GetXHelper/FirebaseController.dart';
import 'package:flutter_login_ui/Screen/LoginPage.dart';
import 'package:flutter_login_ui/Screen/create_blog.dart';
import 'package:flutter_login_ui/services/home.dart';

import 'package:get/get.dart';

import 'ProfilePage.dart';
import 'ReportScreen.dart';
import 'SearchScreen.dart';

class Dashboard extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyNavigationBar());
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    CloudFirestoreSearch(),
    CreateBlog(),
    ReportScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
              selectedItemColor: Colors.white60,
              unselectedItemColor: Colors.blueGrey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text(''),
                  // backgroundColor: Colors.green
                ),
                /*BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text(''),
                ),*/
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sticky_note_2_outlined),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(''),
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              iconSize: 25,
              onTap: _onItemTapped,
              elevation: 1),
        ),
      ),
    );
  }
}
