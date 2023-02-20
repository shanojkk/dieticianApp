import 'package:flutter/material.dart';

class Meal {
  
  final int serving;
  final String foodName;
  final double calorie;
  final double gramPerServing;
  final double totalFats;
  final double totalCarb;
  final double totalProtein;

  Meal({
    required this.serving,
    required this.foodName,
    required this.calorie,
    required this.gramPerServing,
    required this.totalCarb,
    required this.totalFats,
    required this.totalProtein,
  });

}