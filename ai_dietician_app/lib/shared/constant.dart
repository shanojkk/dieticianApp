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
String? validateHeight(String value){
  String height = r'(^([0-9]{3}$)';
  RegExp regexHeight = new RegExp(height);
  if(regexHeight.hasMatch(value)){
    return 'Please enter valid mobile number';
  }
  else if(value.length == 0){
    return 'Please enter mobile number';
  }
  return null;
}

