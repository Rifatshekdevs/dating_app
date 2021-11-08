import 'package:dating_app/src/pages/ChatPage.dart';
import 'package:dating_app/src/pages/mainPage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Bottom extends StatefulWidget {
  @override
  State<Bottom> createState() => _MyBottomState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyBottomState extends State<Bottom> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    ChatPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.homeOutline,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.navigation2Outline,
              size: 25,
            ),
            label: 'Navigate',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.squareOutline,
              size: 25,
            ),
            label: 'Square',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.settings2Outline,
              size: 25,
            ),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('FF84B9'),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
