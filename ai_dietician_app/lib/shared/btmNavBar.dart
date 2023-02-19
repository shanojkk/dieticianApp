// ignore_for_file: prefer_const_constructors

import 'package:ai_dietician_app/screens/diary/diary.dart';
import 'package:ai_dietician_app/screens/diet/diet.dart';
import 'package:ai_dietician_app/screens/progress/progress.dart';
import 'package:flutter/material.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Diary(), 
    Progress(),
    Diet(),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.grey[400],),
            backgroundColor: Colors.grey[200],
            label: 'Diary',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Progress',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.apple),
            label: 'Diet',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Insight',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recipe',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[400],
        onTap: _onItemTapped,
      );
    
  }
}