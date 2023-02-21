// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/screens/diary/diary.dart';
import 'package:ai_dietician_app/screens/diet/diet.dart';
import 'package:ai_dietician_app/screens/insight/insight.dart';
import 'package:ai_dietician_app/screens/progress/progress.dart';
import 'package:ai_dietician_app/screens/recipe/recipe.dart';
import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:ai_dietician_app/shared/btmNavBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Diary(), 
    Progress(),
    Diet(),
    Insight(),
    Recipe(),
    
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;

  int get selectedScreen => _selectedIndex;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed:() async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout), 
            label: Text('logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[400], 
              elevation: 0.0
              ),
            )
        ],
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: Home._widgetOptions,
      ),

      backgroundColor: Colors.green[700],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book,),
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
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[700],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}