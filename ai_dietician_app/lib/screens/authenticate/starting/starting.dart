// ignore_for_file: prefer_const_constructors

import 'package:ai_dietician_app/screens/authenticate/starting/chgWeightBiodata.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/goal.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/remainWeightBiodata.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/testGoal.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:ai_dietician_app/models/user.dart';
import 'package:provider/single_child_widget.dart';



class Starting extends StatefulWidget {

  final Function toggleView;
  Starting({required this.toggleView});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {

  late Goal? goal = null;

  final GoalDiet goalDiet = GoalDiet();

  // Using GlobalKey to access state in child widget from parent widget

  // final GlobalKey <TestGoalState>_childKey = GlobalKey();

  // Goal get _getChildState{
  //   return _childKey.currentState!.testGoalGetter;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to AI Dietician'),
        actions: <Widget> [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Login", style: TextStyle(color:Colors.black)),
            ),
        ]
      ),

      
      backgroundColor: Colors.green[400],
      body: Column(
        children: <Widget>[
          SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              BreadCrumb(
                overflow: WrapOverflow(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 5.0,                  
                ),
                items: <BreadCrumbItem>[                                    
                  
                  BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),                     
                    ),
                  BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),                     
                    ),
                  BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),                     
                    ),
                  BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),                     
                    ),
                  BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),                     
                    ),
                  
                ],
              ),
              ]
          ),

          SizedBox(height:20.0),

          goalDiet,


          // Using GlobalKey to access state in child widget from parent widget

          // TestGoal(key: _childKey),
          // ElevatedButton(
          //   onPressed: (){
          //     setState(() {
          //       goal = _getChildState;
          //     });
          //   }, 

          //   child: Text('TestGoal : $goal'),
          // ),

          ElevatedButton(
              onPressed:() {
                setState(() {
                  goal = goalDiet.getGoalDiet;
                });

                if(goal == Goal.maintain_weight){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RemainWeightBiodata(toggleView: widget.toggleView,))
                  );
                }
                else{
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChgWeightBiodata(toggleView: widget.toggleView,))
                  );
                }

              },

              style:  ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
              ),

              child: Text(
                "$goal - Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  )
                ),
              )
        ],
        )

    );
  }
}