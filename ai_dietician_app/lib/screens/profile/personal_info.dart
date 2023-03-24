// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/starting.dart';
import 'package:ai_dietician_app/screens/profile/updateWeight.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:ai_dietician_app/shared/customAlertDialog.dart';
import 'package:ai_dietician_app/shared/customRadioDialog.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:ai_dietician_app/shared/udpateGoal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  final _formKey  = GlobalKey<FormState>();
  final homeNavigatorKey = GlobalKey<NavigatorState>();
  final _focusNode = FocusNode();

  String? username;
  int? age; 
  Gender? gender;
  DateTime? date_of_birth;
  String? height;
  String? weight;
  Goal? goal;
  String? goal_weight;
  String? activityFactor;
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
          goal = userData.goal;
          activityFactor = userData.activityFactor;
          
          return Scaffold(
            backgroundColor: Colors.grey[300],              
            appBar: AppBar(
              title: Text("PERSONAL INFORMATION"),             
              elevation: 0.0,
            ),

            // Nested Navigator allows target route to be child of current parent widget, but argument passing not available------------------------------------

            // body: Navigator(
            //   key:homeNavigatorKey,
            //   onGenerateRoute: (settings) {
            //     if(settings.name == "/child"){
            //       return MaterialPageRoute(builder: (context) => Starting());
            //     }
            //     else{
            //       return MaterialPageRoute(
            //         builder:(context) {
            //           return SingleChildScrollView(
            //             child: Container(        
            //               margin: EdgeInsets.all(15.0),
            //               child: Form(
            //                 key: _formKey,
            //                 child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start, 
            //                 children: <Widget>[
            //                   Text("GOAL"),
              
                                      
            //                   Card(
            //                     margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
            //                     color: Colors.white,
            //                     child: Column(
            //                       children: [
              
            //                         // Goal  
            //                         ListTile(
            //                           leading: Text("Goal", style: TextStyle(fontSize: 18.0)),
            //                           title: goal != null ? Text("${goal!.toShortString()}", textAlign: TextAlign.end) : Text("${userData.goal.toShortString()}", textAlign: TextAlign.end,),
            //                           trailing: SizedBox(
            //                             width: 25,
            //                             child: Row(
            //                               children: [                               
            //                                 Icon(Icons.arrow_forward),                            
            //                             ]),
            //                           ),
                                            
            //                           onTap: () {
                                        
            //                             // Update Goal, Goal_weight, and current weight
            //                             homeNavigatorKey.currentState?.pushNamed('/child');
              
            //                           },
                                      
            //                         ),
                          
            //                         Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
              
            //                         // Goal Weight        
            //                         ListTile(
            //                           leading: Text("Goal Weight", style: TextStyle(fontSize: 18.0)),
            //                           title: goal_weight != null ? Text("$goal_weight kg", textAlign: TextAlign.end,) : Text("${userData.goal_weight} kg", textAlign:TextAlign.end),
            //                           trailing: Icon(Icons.arrow_forward),                                
            //                           onTap: () async{
                          
            //                           String? goalWeight = await showDialog<String>(
            //                               context: context,
            //                               builder: (BuildContext context) {
                          
            //                                 return  UpdateWeight(
            //                                   weight: userData.goal_weight, 
            //                                   dataToUpdate: "goal_weight", 
            //                                   user:user
            //                                   );
                          
            //                               },
            //                             );
                          
            //                             if(goalWeight != null){
            //                                 setState(() {
            //                                 goal_weight = goalWeight;
            //                               });          
              
            //                               DatabaseValue <String> genericGoal = DatabaseValue(goalWeight);
            //                               DatabaseService(uid: user.uid).updateUserSingleData("goal_weight", genericGoal);
              
            //                               if (int.parse(goal_weight!) > int.parse(weight!)){
            //                                 setState(() {
            //                                   goal = Goal.gain_weight;
            //                                 });
            //                               }
              
            //                             }
                                      
            //                           },
            //                         ),
                                            
            //                       ],
            //                       ),
            //                   ),
                          
            //                   Text("INFORMATION"),
                          
            //                   Card(
            //                     margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
            //                     color: Colors.white,
            //                     child: Column(
            //                       children: [
                                    
            //                         // Username
            //                         ListTile(
            //                           leading: Text("Username", style: TextStyle(fontSize: 18.0)),
            //                           title: username == null ? Text("${userData.username}", textAlign: TextAlign.end,) : Text("$username", textAlign: TextAlign.end,),
            //                           trailing: Icon(Icons.arrow_forward),
            //                           onTap: () async {
                          
            //                             final userName = await showDialog<String>(
            //                               context: context,
            //                               builder: (BuildContext context) {
              
            //                                 return CustomAlertDialog(
            //                                   title: "Update Username", 
            //                                   widgetValue: userData.username, 
            //                                   dataToUpdate: "username",
            //                                   validation: validateWords,                                    
            //                                   user: user
            //                                 );
                          
            //                               },
            //                             );    
              
            //                             if (userName!=null){
            //                               setState(() {
            //                                 username = userName;
            //                               });
              
            //                             }
              
                          
            //                           },
            //                         ),
                          
            //                         Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
              
            //                         // Current Weight
            //                         ListTile(
            //                           leading: Text("Current Weight", style: TextStyle(fontSize: 18.0)),
            //                           title: weight != null ? Text("$weight kg", textAlign: TextAlign.end,) : Text("${userData.current_weight} kg", textAlign: TextAlign.end,),
            //                           trailing: Icon(Icons.arrow_forward),
            //                           onTap:() async {
                          
            //                             String? currentWeight = await showDialog<String>(
            //                               context: context,
            //                               builder: (BuildContext context) {
              
            //                                 return  UpdateWeight(
            //                                   weight: userData.current_weight, 
            //                                   dataToUpdate: "current_weight", 
            //                                   user: user
            //                                   );   
              
            //                               },
            //                             );
                          
            //                             if(currentWeight != null){
            //                                 setState(() {
            //                                 weight = currentWeight;
            //                               });          
                          
            //                               // DatabaseService(uid: user.uid).updateUserSingleData("current_weight", weight!);
                          
            //                             }                  
            //                           },
            //                         ),
                          
            //                         Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
              
            //                         // Current Height
            //                         ListTile(
            //                           leading: Text("Current Height", style: TextStyle(fontSize: 18.0)),
            //                           title: height != null ? Text("$height cm", textAlign: TextAlign.end,) : Text("${userData.current_height} cm", textAlign: TextAlign.end,),
            //                           trailing: Icon(Icons.arrow_forward),
            //                           onTap: () async {
                          
            //                             final updatedHeight = await showDialog<String>(
            //                               context: context,
            //                               builder: (BuildContext context) {
              
            //                                 return CustomAlertDialog(
            //                                   title: "Update Height", 
            //                                   widgetValue: userData.current_height, 
            //                                   dataToUpdate: "current_height",
            //                                   validation: validateHeightAndWeight,                                    
            //                                   user: user
            //                                 );
                          
            //                               },
            //                             );    
              
            //                             if (updatedHeight!=null){
            //                               setState(() {
            //                                 height = updatedHeight;
            //                               });
              
            //                             }
              
                          
            //                           },
            //                         ),
                          
            //                         Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
              
            //                         // Date of Birth
            //                         ListTile(
            //                           leading: Text("Date of birth", style: TextStyle(fontSize: 18.0)),
            //                           title: Text("${userData.date_of_birth.toString().substring(0,10)}", textAlign: TextAlign.end,),
            //                           trailing: Icon(Icons.arrow_forward),
            //                           onTap:() async {
            //                             DateTime? newDate = await showDatePicker(
              
            //                               context: context, 
            //                               initialDate: userData.date_of_birth, 
            //                               firstDate: DateTime(1900), 
            //                               lastDate: DateTime(2100),
              
            //                               );
                                        
            //                             if(newDate != null){
            //                               setState(() {
            //                                 date_of_birth = newDate;
            //                                 age = DateTime.now().year - date_of_birth!.year;
            //                               });
              
            //                               DatabaseValue <DateTime> genericDate = DatabaseValue(newDate);
            //                               DatabaseService(uid: user.uid).updateUserSingleData("date_of_birth", genericDate);
              
            //                             }
            //                             else return;
              
            //                     }, 
            //                         ),
                          
            //                         Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
              
            //                         // Gender
            //                         ListTile(
            //                           leading: Text("Gender", style: TextStyle(fontSize: 18.0)),
            //                           title: gender != null ? Text("${gender!.toShortString()}", textAlign: TextAlign.end,) : Text("${userData.gender.toShortString()}", textAlign: TextAlign.end,),
            //                           trailing: Icon(Icons.arrow_forward),
            //                           onTap:() async {
              
            //                             Gender? udpatedGender = await showDialog<Gender>(
            //                               context: context,
            //                               builder: (BuildContext context){                                
            //                                 return CustomGenderRadioDialog(
            //                                   widgetValue: userData.gender, 
            //                                   dataToUpdate: "gender", 
            //                                   user: user
            //                                   );
            //                               }
            //                               );
                                        
            //                             if(udpatedGender!=null){
            //                               setState(() {
            //                                 gender = udpatedGender;
            //                               });
            //                             }
              
            //                           },
            //                         ),
                          
                        
            //                       ],
            //                     ),
            //                   ),
                                        
            //                 ],
                                        
            //                 ),
            //               ),
            //             ),
            //           );
            //         }, 
            //       );
            //     }
            //   },
            // ),

            // Use normal Navigator 1.0 to pass argument for now----------------------------------------------------

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

                              setState(() {
                                goal = userData.goal;
                              });
                              
                              // Update Goal, Goal_weight, and current weight
                              Navigator.of(context).push(
                                MaterialPageRoute(builder:(context) => UpdateGoal(
                                  goal: goal!,
                                  weight: userData.current_weight,
                                  goal_weight: userData.goal_weight,
                                  age: age.toString(),
                                  gender: gender!,
                                  activityFactor: activityFactor!,
                                  height: height.toString(),
                                  weightChgPerWeek: weightChgPerWeek.toString(),
                                  user: user,
                                  ),                                  

                                  settings: RouteSettings(name: 'UpdateGoal')
                                )
                              );
    
                            },
                            
                          ),

                          if(goal != Goal.maintain_weight)
                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
    
                          // Goal Weight
                          if(goal != Goal.maintain_weight)
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

                                DatabaseValue <String> genericAge = DatabaseValue(age.toString());
                                DatabaseService(uid: user.uid).updateUserSingleData("age", genericAge);
    
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

                          Divider(thickness: 2.0, indent: 12.0, endIndent: 12.0,),
    
                          // Physical Activity Level / Activity Factor
                          ListTile(
                            leading: Text("Activity Level", style: TextStyle(fontSize: 18.0)),
                            title: DropdownButtonFormField(
                                      focusNode: _focusNode,
                                      dropdownColor: Colors.amber,                 
                                      decoration: textInputDecoration.copyWith(
                                        // labelText: "Activity Level",
                                        labelStyle: TextStyle(backgroundColor: Colors.white),                                        
                                      ),
                                      isExpanded: true,
                                      value: double.parse(activityFactor!),
                                      items: <DropdownMenuItem<double>>[
                                        DropdownMenuItem(
                                          value: 1.1,
                                          child: Text('Inactive - Patient with limited physical mobility',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                        DropdownMenuItem(
                                          value: 1.2,
                                          child: Text('Sedentary - Little to no exercise',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                        DropdownMenuItem(
                                          value: 1.3,
                                          child: Text('Light Exercise - 1 to 3 days per week',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                        DropdownMenuItem(
                                          value: 1.5,
                                          child: Text('Moderate Exercise - 3 to 5 days per week',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                        DropdownMenuItem(
                                          value: 1.7,
                                          child: Text('Heavy Exercise - 6 to 7 days per week',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                        DropdownMenuItem(
                                          value: 1.9,
                                          child: Text('Very Heavy Exercise - twice per day / extra heavy workouts',maxLines: 2, overflow: TextOverflow.fade),
                                          alignment: AlignmentDirectional.centerStart,
                                        ),
                                      ], 
                                      onChanged:(value) {
                                        setState(() {
                                          activityFactor = value.toString();                                        
                                        });

                                        DatabaseValue<String> genericActivityFactor = DatabaseValue(activityFactor!);
                                        DatabaseService(uid: user.uid).updateUserSingleData("activity_factor", genericActivityFactor);

                                      }, 
                                      ),
                            
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