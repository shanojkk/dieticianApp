// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/profile/updateWeight.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:ai_dietician_app/shared/customAlertDialog.dart';
import 'package:ai_dietician_app/shared/customRadioDialog.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  final _formKey  = GlobalKey<FormState>();

  String? username;
  int? age; 
  Gender? gender;
  DateTime? date_of_birth;
  String? height;
  String? weight;
  Goal? goal;
  String? goal_weight;
  double? weightChgPerWeek;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(

      stream: DatabaseService(uid: user.uid).userData,
      builder: ((context, snapshot) {              

        print("snapshot.hasData: ${snapshot.hasData}");
        
        if(snapshot.hasData){
          
          UserData userData = snapshot.data as UserData;
          
          return Scaffold(
            backgroundColor: Colors.grey[300],              
            appBar: AppBar(
              title: Text("PERSONAL INFORMATION"),             
              elevation: 0.0,
            ),

            body: SingleChildScrollView(
              child: Container(        
                margin: EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start, 
                   children: <Widget>[
                    Text("GOAL"),

                             
                    Card(
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      color: Colors.white,
                      child: Column(
                        children: [

                           // Goal  
                          ListTile(
                            leading: Text("Goal", style: TextStyle(fontSize: 18.0)),
                            title: goal != null ? Text("${goal!.toShortString()}", textAlign: TextAlign.end) : Text("${userData.goal.toShortString()}", textAlign: TextAlign.end,),
                            trailing: SizedBox(
                              width: 25,
                              child: Row(
                                children: [                               
                                  Icon(Icons.arrow_forward),                            
                              ]),
                            ),
                                  
                            onTap: () {
                              
                              // Update Goal, Goal_weight, and current weight

                            },
                            
                          ),
                
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),

                          // Goal Weight        
                          ListTile(
                            leading: Text("Goal Weight", style: TextStyle(fontSize: 18.0)),
                            title: goal_weight != null ? Text("$goal_weight kg", textAlign: TextAlign.end,) : Text("${userData.goal_weight} kg", textAlign:TextAlign.end),
                            trailing: Icon(Icons.arrow_forward),                                
                            onTap: () async{
                
                             String? goalWeight = await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {
                
                                  return  UpdateWeight(
                                    weight: userData.goal_weight, 
                                    dataToUpdate: "goal_weight", 
                                    user:user
                                    );
                
                                },
                              );
                
                              if(goalWeight != null){
                                  setState(() {
                                  goal_weight = goalWeight;
                                });          

                                DatabaseValue <String> genericGoal = DatabaseValue(goalWeight);
                                DatabaseService(uid: user.uid).updateUserSingleData("goal_weight", genericGoal);

                                if (int.parse(goal_weight!) > int.parse(weight!)){
                                  setState(() {
                                    goal = Goal.gain_weight;
                                  });
                                }

                              }
                            
                            },
                          ),
                                  
                        ],
                        ),
                    ),
                
                    Text("INFORMATION"),
                
                    Card(
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          
                          // Username
                          ListTile(
                            leading: Text("Username", style: TextStyle(fontSize: 18.0)),
                            title: username == null ? Text("${userData.username}", textAlign: TextAlign.end,) : Text("$username", textAlign: TextAlign.end,),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () async {
                
                              final userName = await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {

                                  return CustomAlertDialog(
                                    title: "Update Username", 
                                    widgetValue: userData.username, 
                                    dataToUpdate: "username",
                                    validation: validateWords,                                    
                                    user: user
                                  );
                
                                },
                              );    

                              if (userName!=null){
                                setState(() {
                                  username = userName;
                                });

                              }

                
                            },
                          ),
                
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),

                          // Current Weight
                          ListTile(
                            leading: Text("Current Weight", style: TextStyle(fontSize: 18.0)),
                            title: weight != null ? Text("$weight kg", textAlign: TextAlign.end,) : Text("${userData.current_weight} kg", textAlign: TextAlign.end,),
                            trailing: Icon(Icons.arrow_forward),
                            onTap:() async {
                
                              String? currentWeight = await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {

                                  return  UpdateWeight(
                                    weight: userData.current_weight, 
                                    dataToUpdate: "current_weight", 
                                    user: user
                                    );   

                                },
                              );
                
                              if(currentWeight != null){
                                  setState(() {
                                  weight = currentWeight;
                                });          
                
                                // DatabaseService(uid: user.uid).updateUserSingleData("current_weight", weight!);
                
                              }                  
                            },
                          ),
                
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),

                          // Current Height
                          ListTile(
                            leading: Text("Current Height", style: TextStyle(fontSize: 18.0)),
                            title: height != null ? Text("$height cm", textAlign: TextAlign.end,) : Text("${userData.current_height} cm", textAlign: TextAlign.end,),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () async {
                
                              final updatedHeight = await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {

                                  return CustomAlertDialog(
                                    title: "Update Height", 
                                    widgetValue: userData.current_height, 
                                    dataToUpdate: "current_height",
                                    validation: validateHeightAndWeight,                                    
                                    user: user
                                  );
                
                                },
                              );    

                              if (updatedHeight!=null){
                                setState(() {
                                  height = updatedHeight;
                                });

                              }

                
                            },
                          ),
                
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),

                          // Date of Birth
                          ListTile(
                            leading: Text("Date of birth", style: TextStyle(fontSize: 18.0)),
                            title: Text("${userData.date_of_birth.toString().substring(0,10)}", textAlign: TextAlign.end,),
                            trailing: Icon(Icons.arrow_forward),
                            onTap:() async {
                              DateTime? newDate = await showDatePicker(

                                context: context, 
                                initialDate: userData.date_of_birth, 
                                firstDate: DateTime(1900), 
                                lastDate: DateTime(2100),

                                );
                              
                              if(newDate != null){
                                 setState(() {
                                  date_of_birth = newDate;
                                  age = DateTime.now().year - date_of_birth!.year;
                                });

                                DatabaseValue <DateTime> genericDate = DatabaseValue(newDate);
                                DatabaseService(uid: user.uid).updateUserSingleData("date_of_birth", genericDate);

                              }
                              else return;

                      }, 
                          ),
                
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),

                          // Gender
                          ListTile(
                            leading: Text("Gender", style: TextStyle(fontSize: 18.0)),
                            title: gender != null ? Text("${gender!.toShortString()}", textAlign: TextAlign.end,) : Text("${userData.gender.toShortString()}", textAlign: TextAlign.end,),
                            trailing: Icon(Icons.arrow_forward),
                            onTap:() async {

                              Gender? udpatedGender = await showDialog<Gender>(
                                context: context,
                                builder: (BuildContext context){                                
                                  return CustomGenderRadioDialog(
                                    widgetValue: userData.gender, 
                                    dataToUpdate: "gender", 
                                    user: user
                                    );
                                }
                                );
                              
                              if(udpatedGender!=null){
                                setState(() {
                                  gender = udpatedGender;
                                });
                              }

                            },
                          ),
                
               
                        ],
                      ),
                    ),
                              
                   ],
                              
                  ),
                ),
              ),
            ),

          );

        }
        else{
          print("Snapshot error: ${snapshot.error}");
          return Loading();
        }

      })


    );
  }
}