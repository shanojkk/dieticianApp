import 'package:flutter/material.dart';

class MyUser{
  final String uid;

  MyUser({required this.uid});

}

enum Gender {male, female}
enum Goal {lose_weight, maintain_weight, gain_weight}

class UserData{

  final String uid;
  final String name;
  final int age;
  final double current_weight;
  final double current_height;
  final Goal goal;
  final double goal_weight;
  final DateTime date_of_birth;
  final Gender gender;
  
  UserData({
    required this.uid, 
    required this.name, 
    required this.age, 
    required this.current_weight,
    required this.current_height,
    required this.goal,
    required this.goal_weight,
    required this.date_of_birth,
    required this.gender,
    });
}