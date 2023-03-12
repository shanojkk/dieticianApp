// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/register.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BiodataForm extends StatefulWidget {

  final Goal goal;

  //const ChgWeightBiodata({super.key});

  BiodataForm({required this.goal});

  @override
  State<BiodataForm> createState() => BiodataFormState();
}

class BiodataFormState extends State<BiodataForm> {

  DateTime _currentDate = DateTime.now();

  late String username;
  late Gender gender = Gender.male;
  late DateTime date_of_birth = DateTime.now();
  late String height;
  late String weight;
  late String goal_weight;
  late double weightChgPerWeek = 0.5;

  String error = "";

  final _formKey = GlobalKey<FormState>();

  bool validated = false;


  // getter
  String get getUsername => username;
  Gender get getGender => gender;
  DateTime get getDOB => date_of_birth;
  String get getHeight => height;
  String get getWeight  => weight;
  String get getGoalweight => goal_weight;
  double get getWeightChgPerWeek => weightChgPerWeek;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Biodata")
      ),

      backgroundColor: Colors.green[700],

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),

                // Username          
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Username',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid,
                    )
                  ),
                  

                  ),
                  validator:(value) => !validateWords(value!) ? "Please enter valid name without special characters": null,
                  onChanged: (value) => setState(() {
                    username = value;
                  }),
                ),

                SizedBox(height: 20.0,),


                // Gender Picker                
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: Gender.male,
                  items: <DropdownMenuItem<Gender>>[
                    DropdownMenuItem(
                      value: Gender.female,
                      child: Text('Female'),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    DropdownMenuItem(
                      value: Gender.male,
                      child: Text('Male'),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                  ], 
                  onChanged: ((value) => setState(() {
                    gender = value!;
                    print("gender - $gender");
                    })
                  ),
                  ),
          
                SizedBox(height: 20.0,),
          
                // Date of Birth Picker
                Text(
                  '${_currentDate.year}/${_currentDate.month}/${_currentDate.day}',
                  style: TextStyle(fontSize: 32.0),
                ),

                ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context, 
                      initialDate: _currentDate, 
                      firstDate: DateTime(1900), 
                      lastDate: DateTime(2100),
                      );

                    if(newDate == null) return;

                    setState(() {
                      date_of_birth = newDate;
                      _currentDate = newDate;
                    });
                  }, 
                  child: Text('Select Date of Birth'),
                  ),               

                SizedBox(height: 20.0,),

                // Height          
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Height',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid,
                    )
                  ),
                  suffixText: "CM",

                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator:(value) => !validateHeightAndWeight(value!) ? "Please enter valid height(cm)": null,
                  onChanged: (value) => setState(() {
                    height = value;
                  }),
                ),


                SizedBox(height: 20.0,),

                // Weight
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Weight',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid,
                    )
                  ),
                  suffixText: "KG",

                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator:(value) => !validateHeightAndWeight(value!) ? "Please enter valid weight(kg)": null,
                  onChanged: (value) => setState(() {
                    weight = value;
                  }),
                ),

                SizedBox(height: 20.0,),

                 // Goal Weight
                Visibility(
                  visible: widget.goal == Goal.maintain_weight ? false : true,
                  child: TextFormField(
                                      
                    decoration: textInputDecoration.copyWith(
                    hintText: 'Goal Weight',
                    filled: true,                    
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width:  3.0,
                        style:  BorderStyle.solid,
                      )
                    ),
                    suffixText: "KG",
                
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    validator:(value) => !validateHeightAndWeight(value!) ? "Please enter valid weight(kg)": null,
                    onChanged: (value) => setState(() {
                      goal_weight = value;
                    }),
                  ),
                ),

                SizedBox(height: 20.0,),
          
                // Goal Progress
                if(widget.goal != Goal.maintain_weight)               
                DropdownButtonFormField(                    
                    decoration: textInputDecoration.copyWith(
                      labelText: "Progress",
                      labelStyle: TextStyle(backgroundColor: Colors.white),
                      suffixText: "KG/Week",                    
                    ),
                    value: 0.5,
                    items: <DropdownMenuItem<double>>[
                      DropdownMenuItem(
                        value: 0.1,
                        child: Text('0.1'),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      DropdownMenuItem(
                        value: 0.2,
                        child: Text('0.2'),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      DropdownMenuItem(
                        value: 0.3,
                        child: Text('0.3'),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      DropdownMenuItem(
                        value: 0.4,
                        child: Text('0.4'),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      DropdownMenuItem(
                        value: 0.5,
                        child: Text('0.5'),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                    ], 
                    onChanged: ((value) => setState(() {
                      weightChgPerWeek = value!;
                      
                      })
                    ),
                    ),
                

                  SizedBox(height: 12.0,),

                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),

                  SizedBox(height: 12.0,),

                  ElevatedButton(
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        setState(() {
                          this.error = "";
                        });
                        

                        

                      }
                      else{
                        setState(() {
                          this.error = "Please fill in all the textfield. ";
                        });
                      }

                      
                        
                    },
                    child: Text("Next"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 55.0, right: 55.0),
                    )

                  ),

                
              ],
              ),
          ),
        ),
      ),



    );
  }
}