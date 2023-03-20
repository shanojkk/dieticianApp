import 'package:flutter/material.dart';

class MyUser{
  final String uid;

  MyUser({required this.uid});

}

enum Gender {male, female}
enum Goal {lose_weight, maintain_weight, gain_weight}

extension GoalParseToString on Goal {
  String toShortString() {
    String input = this.toString().split('.').last;
    String output = input.split('_')
    .map((word) => word.substring(0,1).toUpperCase() + word.substring(1))
    .join(' ');

    return output;
  }
}

extension GenderParseToString on Gender{
  String toShortString(){
    String input = this.toString().split('.').last.replaceAll("_", " ");
    String output = input.substring(0, 1).toUpperCase() + input.substring(1);

    return output;
  }
}


class UserData{

  final String uid;
  final String username;
  final String email;
  final String password;
  final int age;
  final String current_weight;
  final String current_height;
  final Goal goal;
  final String goal_weight;
  final DateTime date_of_birth;
  final Gender gender;
  
  UserData({
    required this.uid, 
    required this.username, 
    required this.email,
    required this.password,
    required this.age, 
    required this.current_weight,
    required this.current_height,
    required this.goal,
    required this.goal_weight,
    required this.date_of_birth,
    required this.gender,
    });
}