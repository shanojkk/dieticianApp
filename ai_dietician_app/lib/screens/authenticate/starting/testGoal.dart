import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/goal.dart';
import 'package:flutter/material.dart';

// Testing widget for GlobalKey state accessing child widget from parent widget
// Not advisable as this method requires the child widget to make the state class as a public class instead of a private class

class TestGoal extends StatefulWidget {
  const TestGoal({Key? key}):super(key:key);

  @override
  State<TestGoal> createState() => TestGoalState();   // Public class, does not have the "_" behind the class name
}

class TestGoalState extends State<TestGoal> {         // Public class

  Goal goal = Goal.lose_weight;

  Goal get testGoalGetter => goal;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}