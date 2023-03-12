// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/starting.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class GoalDiet extends StatefulWidget {
  GoalDiet({super.key});
  
  late Goal goal = Goal.lose_weight;

  Goal get getGoalDiet{
    return goal;
  }


  @override
  State<GoalDiet> createState() => _GoalDietState();
}

class _GoalDietState extends State<GoalDiet> {

  final _formKey  = GlobalKey<FormState>();

  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false; 
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "What's the goal you are aiming for ?",
              style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        )
            ),
      
            SizedBox(height: 20.0,),

            // Lose Weight
            ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.lose_weight;
                    selected1 = true;
                    selected2 = false;
                    selected3 = false;
                  });
                }),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    "Lose Weight",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,     
                      color: Colors.white,           
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  side: selected1 ? BorderSide(color: Colors.amber, width:3.0) : null,
                  
                ),
                
              ),
            

            SizedBox(height: 20.0,),

            // Maintain Weight
            ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.maintain_weight;
                    selected1 = false;
                    selected2 = true;
                    selected3 = false;
                  });
                }),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    "Maintain Weight",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,     
                      color: Colors.white,           
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  side: selected2 ? BorderSide(color: Colors.amber, width:3.0) : null,
                  
                ),
                
              ),

            SizedBox(height: 20.0,),

            // Gain Weight
            ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.gain_weight;
                    selected1 = false;
                    selected2 = false;
                    selected3 = true;
                  });
                }),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    "Gain Weight",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,     
                      color: Colors.white,           
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  side: selected3 ? BorderSide(color: Colors.amber, width:3.0) : null,
                  
                ),
                
              ),

            SizedBox(height:50.0),

            
          ],
          ),
      )
    );
  }
}