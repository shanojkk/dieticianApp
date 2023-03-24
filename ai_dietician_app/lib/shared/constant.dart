import 'package:ai_dietician_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';


const textInputDecoration = InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  // Normal Border
                  enabledBorder: OutlineInputBorder(      
                    borderSide: BorderSide(color: Colors.white, width: 2.0)
                  ),
                  // Border when selected
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2.0)
                  )
                );


BreadCrumbItem breadCrumbItem = BreadCrumbItem(
                    content: SizedBox(height: 7.0,width: 19.0),                  
                    disableColor: Colors.black,
                    border: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                    );              




// Regular Expression

// Validate height
bool validateHeightAndWeight(String value){
 
 RegExp regexHeightAndWeight = new RegExp(r'^\d{2,3}$');
 if(value != null && regexHeightAndWeight.hasMatch(value) && value.length > 0 ){
  return true;
 }
 else{
  return false;
 }
  
}

// Validate Words
bool validateWords(String value){
  print("Validating Words");
  RegExp regexWord = new RegExp(r'^[A-Za-z]+\s?[A-Za-z]*$');
  if(value != null && regexWord.hasMatch(value) && value.length > 0 ){
  return true;
  }
  else{
    return false;
  }

}




// Generics
class DatabaseValue<T> {
  T value;
  DatabaseValue(this.value);

   T get getValue => value;

}




// Function to calculate daily calorie intake 
double? calcCalorieIntake(
  Goal goal, 
  Gender gender, 
  String age, 
  String weight, 
  String height, 
  String activityFactor, 
  String weightChgPerWeek
  ){

   print("All data: $goal, $gender, $age, $weight, $height, $activityFactor, $weightChgPerWeek");

  // calculate basal metabolic rate with Harris-Benedict Equation
  double bmr;
  if(gender == Gender.male){
    bmr = 13.397*double.parse(weight) + 4.799*double.parse(height) - 5.677*double.parse(age) + 88.362;
  }
  else if (gender == Gender.female){
    bmr = 9.247*double.parse(weight) + 3.098*double.parse(height) - 4.330*double.parse(age) + 447.593;
  }
  else{
    return null;
  }

  // calculate daily calorie intake
  if(goal == Goal.maintain_weight){
    return bmr*double.parse(activityFactor);
  }
  else if(goal == Goal.gain_weight){
    return bmr*double.parse(activityFactor) + (double.parse(weightChgPerWeek)/0.45*3500/7);
  }
  else if(goal == Goal.lose_weight){
    return bmr*double.parse(activityFactor) - (double.parse(weightChgPerWeek)/0.45*3500/7);
  }
  else{
    return null;
  }

  // P.S: According to calorie counter website https://www.calculator.net/calorie-calculator.html,
  // 1 pound is approximately 0.45kg which also equals to 3500 calories.
  // It is recommended to not lower calorie intake over 1000 calorie than normal daily calorie intake required for 
  // normal daily body fuinction.

  // As an example, in weight loss of losing 0.5kg per week, (0.45 round up to 0.5), 
  // approximately reducing 3500 calories per week. If the BMR of a normal person is 2500 calorie per day, in order
  // to conduct weight loss at a progress of 0.5 kg per week, he will have to reduce his daily calorie intake by 
  // 500 calorie which in total will be 3500 calories in a week. Vice versa for weight gain.

}