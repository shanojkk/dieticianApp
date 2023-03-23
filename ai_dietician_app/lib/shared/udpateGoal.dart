
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:ai_dietician_app/screens/authenticate/starting/biodataForm.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/goal.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/testGoal.dart';
import 'package:ai_dietician_app/screens/profile/editWeight.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:ai_dietician_app/models/user.dart';
import 'package:provider/single_child_widget.dart';



class UpdateGoal extends StatefulWidget {

  //final Function toggleView;
  //Starting({required this.toggleView});

  Goal goal = Goal.lose_weight;
  String weight;
  String goal_weight;
  final user;

  // UpdateGoal({super.key});

  UpdateGoal({required this.goal, required this.weight, required this.goal_weight, required this.user});

  @override
  State<UpdateGoal> createState() => _UpdateGoalState();
}

class _UpdateGoalState extends State<UpdateGoal> {

  late Goal? stateGoal = widget.goal;
  late bool selected1;
  late bool selected2;
  late bool selected3;

  @override
  Widget build(BuildContext context) {

    if(stateGoal == null){
      setState(() {
        stateGoal = widget.goal;
      });

    }

    if(stateGoal == Goal.lose_weight){
        setState(() {
          selected1 = true;
          selected2 = false;
          selected3 = false;
        });
        
      }
      else if(stateGoal == Goal.maintain_weight){
        setState(() {
          selected1 = false;
          selected2 = true;
          selected3 = false;
        });
        
      }
      else{
        setState(() {
          selected1 = false;
          selected2 = false;
          selected3 = true;
        });
        
      }

    

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Update Goal'),
        
      ),
    
      
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: EdgeInsets.all(25.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[

              SizedBox(height:20.0),

              Text(
                "What is your goal ?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold 
                  )
                ),

              SizedBox(height:90.0),

              // Lose Weight
              ElevatedButton(
                  onPressed: (() {
                    setState(() {
                      stateGoal = Goal.lose_weight;
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
                    padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 40.0)
                  ),
                  
                ),
              
      
              SizedBox(height: 40.0,),
      
              // Maintain Weight
              ElevatedButton(
                  onPressed: (() {
                    setState(() {
                      stateGoal = Goal.maintain_weight;
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
                    padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 22.0)
                  ),
                  
                ),
      
              SizedBox(height: 40.0,),
      
              // Gain Weight
              ElevatedButton(
                  onPressed: (() {
                    setState(() {
                      stateGoal = Goal.gain_weight;
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
                    padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 40.0)
                    
                  ),
                  
                ),
      
            SizedBox(height: 130.0),
      
            ElevatedButton(
                onPressed:() {                    
                    Navigator.of(context).push (
                      MaterialPageRoute(builder: (context) => EditWeight(
                        goal: stateGoal!, 
                        currentWeight: widget.weight,
                        goalWeight: widget.goal_weight,
                        user: widget.user,
                        ),
                        
                      )
                    );
                },
      
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 80.0)
                ),
      
                child: Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0
                  )
                  ),
                )
          ],
          ),
      )
    
    );
  }
}