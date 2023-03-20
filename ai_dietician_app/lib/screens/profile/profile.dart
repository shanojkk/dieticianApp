// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/profile/personal_info.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    
    return StreamBuilder<UserData>(
     
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        
        UserData? userData = snapshot.data as UserData?;

        if(snapshot.hasData){

          UserData userData = snapshot.data as UserData;

          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text("PROFILE"),
              backgroundColor: Colors.blue,
              ),

            body: Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  // Main Biodata
                  Card(
                    margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20.0,
                            child : Icon(Icons.people),
                          ),
            
                          title: Text("${userData.username}"),
            
                          subtitle: Text("${userData.age} years old"),
            
                        ),
            
                        Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
            
                        ListTile(
                          leading: Text("Current Weight"),
                          trailing: Text("${userData.current_weight} kg"),
                        ),
                
                        ListTile(
                          leading: Text("Goal"),
                          trailing: Text("${userData.goal.toShortString()}"),
                        ),
                     ],
                    )
                  ),
            
                 Text("CUSTOMIZATION"),
            
                  Container(
                    child: SingleChildScrollView(
                      child: Card(
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        color: Colors.white,
                        child: Column(
                          children: [
            
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Personal Information"),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: () {
                                // Lead to Profile registration
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: ((context) => PersonalInfo()))
                                );
                              },
                            ),
            
                            Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
            
                            ListTile(
                              leading: Icon(Icons.food_bank),
                              title: Text("Dietary needs & preferences"),
                              trailing : Icon(Icons.arrow_forward),
                              onTap:() {
                                
                              },
                            ),
            
                            Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
            
                            ListTile(
                              leading: Icon(Icons.water_drop),
                              title: Text("Habits"),
                              trailing : Icon(Icons.arrow_forward),
                              onTap:() {
                                
                              },
                            ),
            
                          ],
                        ),
                      ),
                    ),
                  ),
            
                ],
                ),
            )


          );

        }
        else{

          return Loading();

          // return Scaffold(
          //   appBar: AppBar(
          //     title: Text("PROFILE"),
          //     backgroundColor: Colors.blue,
          //   ),
          //   body: Text("Data not Found!!"),
          //   );
        }
      },
    );
  }
}