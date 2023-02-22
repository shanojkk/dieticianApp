import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});


  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary"),
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

      body: Text("Diary"),
      
    );
  }
}