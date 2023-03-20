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