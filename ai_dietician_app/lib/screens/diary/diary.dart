import 'package:ai_dietician_app/screens/profile/profile.dart';
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

          // Log out
          IconButton(
            onPressed:() async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout),             
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, 
              elevation: 0.0,              
              ),
            ),

            // Profile
            IconButton(
              onPressed: () async {
                // Lead to profile page 
                Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Profile()) 
                )
                );


              },
              icon: Icon(Icons.people),             
              style: ElevatedButton.styleFrom(
                elevation: 0.0,                
              ),
              


            ),


        ],
      ),

      body: Text("Diary"),
      
    );
  }
}