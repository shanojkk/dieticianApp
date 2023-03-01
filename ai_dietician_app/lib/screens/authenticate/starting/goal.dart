// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/starting.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class GoalDiet extends StatefulWidget {
  GoalDiet({super.key});
  
  late Goal goal;

  Goal get getGoalDiet{
    return goal;
  }


  @override
  State<GoalDiet> createState() => _GoalDietState();
}

class _GoalDietState extends State<GoalDiet> {

  final _formKey  = GlobalKey<FormState>();
  

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
      
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 0.0,
              child: ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.lose_weight;
                  });
                }),
                child: Text(
                  "Lose Weight",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,                
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 20.0,),
      
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 0.0,
              child: ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.maintain_weight;
                  });
                }),
                child: Text(
                  "Maintain Weight",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,                
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 20.0,),
      
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 0.0,
              child: ElevatedButton(
                onPressed: (() {
                  setState(() {
                    widget.goal = Goal.gain_weight;
                  });
                }),
                child: Text(
                  "Gain Weight",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,                
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height:50.0),

            
          ],
          ),
      )
    );
  }
}