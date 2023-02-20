import 'package:ai_dietician_app/models/meal.dart';
import 'package:flutter/material.dart';

class DailyDiet{

  final DateTime date;
  final String uid;
  final double calorie_to_consume;
  final int water_intake;
  final int sleep_hours;
  final Meal breakfast;
  final Meal lunch;
  final Meal snacks;
  final Meal dinner;

  DailyDiet({
    required this.date,
    required this.uid,
    required this.calorie_to_consume,
    required this.water_intake,
    required this.sleep_hours,
    required this.breakfast,
    required this.lunch,
    required this.snacks,
    required this.dinner,
    });

}