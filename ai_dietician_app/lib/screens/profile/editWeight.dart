// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/profile/personal_info.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class EditWeight extends StatefulWidget {
  
  Goal goal;
  String currentWeight;
  String goalWeight;
  final user;
  // const EditWeight({super.key});

  EditWeight({required this.goal, required this.currentWeight, required this.goalWeight, required this.user});

  @override
  State<EditWeight> createState() => _EditWeightState();
}

class _EditWeightState extends State<EditWeight> {

  late int stateWeight = int.parse(widget.currentWeight);
  late int stateGoalWeight = int.parse(widget.goalWeight);
  late double stateWeightChgPerWeek = 0.5;
  bool showGoalWeightTracker = false;
  bool showChgWeightPerWeekTracker = false;
  double activeColor = 0.0;


  bool checkWeight (){
    if(stateGoalWeight > stateWeight && widget.goal == Goal.lose_weight && showGoalWeightTracker){
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(25.0),
              child: Text(
                "Goal weight cannot be greater than current weight in lose weight plan.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15.0
                )
                )
            ) ,
            );
        },
      );
      return false;
    }
    else if(stateGoalWeight < stateWeight && widget.goal == Goal.gain_weight && showGoalWeightTracker){
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(25.0),
              child: Text(
                "Goal weight cannot be lower than current weight in gain weight plan.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15.0
                )
                )
            ) ,
            );
        },
      );
      return false;
    }
    else{
      // if(stateSetting!=null){
      //   print("stateSetting not null");
      //   setState(() {
      //     stateSetting = true;
      //   });
      //   print("stateSetting: $stateSetting");
      // }

      return true;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.goal.toShortString()}"),
      ),
      backgroundColor: Colors.grey[300],
      body: Scrollbar(
        isAlwaysShown: true,
        thickness: 10.0,        
        child: SingleChildScrollView(
          child: Container(
            
            margin: EdgeInsets.all(25.0),
            child: Column(         
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      
                // Current Weight--------------------------------------------------------------------------------------------------------------
      
                Text(
                  "What is your current weight ?",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    ),
                ),
        
                SizedBox(height: 20.0),
        
                Container(
                  //height: 160.0,
                  padding: EdgeInsets.all(35.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Current Weight", style: TextStyle(fontSize: 20.0)),
                  
                      SizedBox(height: 20.0,),
                  
                      ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              stateWeight = stateWeight - 1;
                            });
                          },                
                          ),
                        
                        title: Text("$stateWeight KG", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              stateWeight = stateWeight + 1;
                            });
                            print(stateWeight);
                          },                
                          ),
                      ),
        
                      SizedBox(height: 10.0,),
        
                      ElevatedButton(
                        onPressed:() {                              
                          
                          if(widget.goal == Goal.maintain_weight){
                            
                            setState(() {
                              stateGoalWeight = 0;
                              stateWeightChgPerWeek = 0.0;
                            });

                              // Goal
                              DatabaseValue <String> genericGoal = DatabaseValue(widget.goal.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("goal", genericGoal);

                              // Goal Weight
                              DatabaseValue <String> genericGoalWeight = DatabaseValue(stateGoalWeight.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("goal_weight", genericGoalWeight);

                              // Current Weight
                              DatabaseValue <String> genericCurrentWeight = DatabaseValue(stateWeight.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("current_weight", genericCurrentWeight);

                              // Weight Change Per Week
                              DatabaseValue <String> genericWeightChgPerWeek = DatabaseValue(stateWeightChgPerWeek.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("weight_chg_per_week", genericWeightChgPerWeek);


                            // Code here to rearrange the whole diet plan as well as calculating daily calories ///////////////////////////////
      
      
                          }
                          else{
                            bool checkResult = checkWeight();
                            if(checkResult){
                              setState(() {
                                showGoalWeightTracker = checkResult;
                              });
                            }
                          }
                          
                        }, 
                        child: Text("CONFIRM"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 85.0),
                        ),
                      ),
        
                      
                    ]
                    ,)
                ),
      
                SizedBox(height:40.0),
      
                // Target Weight------------------------------------------------------------------------------------------------------------------
                if(showGoalWeightTracker)
                Text(
                  "What is your target weight ?",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    ),
                ),
        
                SizedBox(height: 20.0),

                if(showGoalWeightTracker)
                Container(
                  //height: 160.0,
                  padding: EdgeInsets.all(35.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Goal Weight", style: TextStyle(fontSize: 20.0)),
                  
                      SizedBox(height: 20.0,),
                  
                      ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              stateGoalWeight = stateGoalWeight - 1;
                            });
                          },                
                          ),
                        
                        title: Text("$stateGoalWeight KG", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              stateGoalWeight = stateGoalWeight + 1;
                            });
                            print(stateGoalWeight);
                          },                
                          ),
                      ),
        
                      SizedBox(height: 10.0,),
        
                      ElevatedButton(
                        onPressed:() {                              
                          
                          bool checkResult = checkWeight();

                          if(checkResult){
                            setState(() {
                              showChgWeightPerWeekTracker = checkResult;
                            });
                          }
                          
                        }, 
                        child: Text("CONFIRM"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 85.0),
                        ),
                      ),
        
                      
                    ]
                    ,)
                ),
      
                SizedBox(height: 40.0),
      
                // Weight Change Per Week----------------------------------------------------------------------------------------------------

                if(showChgWeightPerWeekTracker)
                Text(
                  "Choose your progress",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    ),
                ),
        
                SizedBox(height: 20.0),
                
                if(showChgWeightPerWeekTracker)
                Container(
                  //height: 160.0,
                  padding: EdgeInsets.all(35.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Weight Change Per Week", style: TextStyle(fontSize: 20.0)),
                  
                      SizedBox(height: 20.0,),
      
                      Slider(
                        min: 0.1,
                        max: 0.9,
                        divisions: 8,
                        onChanged:(value) {
                          setState(() {
                            stateWeightChgPerWeek = double.parse((value).toStringAsFixed(1));
                            activeColor = stateWeightChgPerWeek*1000;
                            
                          });                      
                        },
                        value: stateWeightChgPerWeek,
                        activeColor: Colors.green[activeColor.toInt()],
                        inactiveColor: Colors.white,
                        label: "$stateWeightChgPerWeek kg / Week",
                      ),
        
                      SizedBox(height: 10.0,),
        
                      ElevatedButton(
                        child: Text("CONFIRM"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 85.0),
                        ),
                        onPressed:() {                              
                                                  
                          bool checkResult = checkWeight();
                            if(checkResult){
                              // Update Goal, Goal Weight, Current Weight and Weight Change per Week to database

                              // Goal
                              DatabaseValue <String> genericGoal = DatabaseValue(widget.goal.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("goal", genericGoal);

                              // Goal Weight
                              DatabaseValue <String> genericGoalWeight = DatabaseValue(stateGoalWeight.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("goal_weight", genericGoalWeight);

                              // Current Weight
                              DatabaseValue <String> genericCurrentWeight = DatabaseValue(stateWeight.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("current_weight", genericCurrentWeight);

                              // Weight Change Per Week
                              DatabaseValue <String> genericWeightChgPerWeek = DatabaseValue(stateWeightChgPerWeek.toString());
                              DatabaseService(uid: widget.user.uid).updateUserSingleData("weight_chg_per_week", genericWeightChgPerWeek);

                              // Code here to rearrange diet plan or calculate daily calories ///////////////////////////////////////////////////

                              Navigator.of(context).popUntil((route) {
                                
                                return route.settings.name == 'PersonalInfo';
                                
                              });

                             //Navigator.of(context).pushNamedAndRemoveUntil('PersonalInfo', ModalRoute.withName('Profile'));

                            //  Navigator.of(context).pushAndRemoveUntil(
                            //   MaterialPageRoute(builder: ((context) {
                            //     return PersonalInfo();
                            //   })),
                            //   ModalRoute.withName("Profile"),
                            //   );

                            }
      
                        }, 
                        
                      ),
        
                      
                    ]
                    ,)
                ),
      
      
      
      
                
      
              ],
              )
          ),
        ),
      ),

      
      

    );
  }
}

