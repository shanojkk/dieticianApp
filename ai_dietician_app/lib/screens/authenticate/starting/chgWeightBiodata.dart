// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChgWeightBiodata extends StatefulWidget {
  const ChgWeightBiodata({super.key});

  @override
  State<ChgWeightBiodata> createState() => _ChgWeightBiodataState();
}

class _ChgWeightBiodataState extends State<ChgWeightBiodata> {

  DateTime _currentDate = DateTime.now();

  late Gender? gender;
  late DateTime date_of_birth;
  late String height;
  late String weight;
  late String goal_weight;
  late double weightChgPerWeek;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Weight Change")
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
                    gender = value;
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
                  validator: (val) {
                    validateHeight(val!);
                  },
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
                  validator: (val) {
                    validateHeight(val!);
                  },
                  onChanged: (value) => setState(() {
                    weight = value;
                  }),
                ),

                SizedBox(height: 20.0,),

                 // Goal Weight
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Goal Weight',
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
                  validator: (val) {
                    validateHeight(val!);
                  },
                  onChanged: (value) => setState(() {
                    goal_weight = value;
                  }),
                ),

                SizedBox(height: 20.0,),
          
                // Goal Progress
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
                    print("Weight Change Per Week - $weightChgPerWeek");
                    })
                  ),
                  ),
                
              ],
              ),
          ),
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {
          
        },
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 55.0, right: 55.0),
        )

        ),


    );
  }
}