
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/authenticate.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/biodataForm.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/goal.dart';
import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;

  Register({required this.toggleView});

  // String username;
  // late int age = DateTime.now().year - date_of_birth.year; 
  // Gender gender;
  // DateTime date_of_birth;
  // String height;
  // String weight;
  // Goal goal;
  // String goal_weight;
  // double weightChgPerWeek;

  // Register({
  //   required this.username,
  //   required this.gender,
  //   required this.date_of_birth,
  //   required this.height,
  //   required this.weight,
  //   required this.goal,
  //   required this.goal_weight,
  //   required this.weightChgPerWeek,
    
  //   });

  //const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey  = GlobalKey<FormState>();
  bool loading = false;


  // text field state variable
  String email = "";
  String password = "";
  String error = "";
  DateTime _currentDate = DateTime.now();

  String username = "";
  late int age = DateTime.now().year - date_of_birth.year; 
  Gender gender = Gender.male;
  DateTime date_of_birth = DateTime.now();
  String height ="";
  String weight = "";
  Goal? goal = null;
  String goal_weight = "";
  double weightChgPerWeek = 0.0;

  bool selected1 = false;
  bool selected2 = false;

  final GlobalKey <BiodataFormState>_childKey = GlobalKey();


  void _showSettingsPanel(Goal goal){
    showModalBottomSheet(context: context, builder: ((context) {
      return Container(
        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: BiodataForm(goal: goal),
      );
    }));
  }  

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[700],

     appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Register to AI Dietician'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black,),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Login", style: TextStyle(color: Colors.black)),
            )
        ],
        ),

      body: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0,),

              // Email
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),

              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),

              SizedBox(height: 20.0,),

              // Password            
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
      
              SizedBox(height: 20.0),

              // Choose Goal
              Row(children: [
                
                Padding(
                  padding: EdgeInsets.only(right:2.0),
                  child: ElevatedButton(
                    onPressed:() {
                      setState(() {
                        goal = Goal.maintain_weight;
                        goal_weight = "";
                        weightChgPerWeek = 0.0;
                        selected1 = true;
                        selected2 = false;
                      });
                      // _showSettingsPanel(goal);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      side: selected1 ? BorderSide(color: Colors.amber, width:3.0) : null,
                      
                    ),                   
                  
                    child: Text(
                      "Remain Weight",
                    )
                  ),
                ),
      
                Padding(
                  padding: EdgeInsets.only(left:2.0),
                  child: ElevatedButton(
                    onPressed:() {
                      setState(() {
                        goal = Goal.lose_weight;
                        selected2 = true;
                        selected1 = false;
                      });
                      // _showSettingsPanel(goal);
                    },                   
                  
                    child: Text(
                      "Change Weight",
                      style: TextStyle(),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      side: selected2 ? BorderSide(color: Colors.amber, width:3.0) : null,
                      
                    ),
                  ),
                ),              
      
      
              ],),

              SizedBox(height: 20.0),

              Visibility(
                visible: goal == null ? false : true,
                child: Column(
                  children: [

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
                      validator:(value) => validateWords(value!) ? null : "Please enter valid name without special characters",
                      onChanged: (value) => setState(() {
                        username = value;
                      }),
                    ),

                    if(goal != Goal.maintain_weight) 
                    SizedBox(height: 20.0,),

                    // Choose lose or gain weight
                    if(goal != Goal.maintain_weight) 
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      value: Goal.lose_weight,
                      items: <DropdownMenuItem<Goal>>[
                        DropdownMenuItem(
                          value: Goal.lose_weight,
                          child: Text('Lose Weight'),
                          alignment: AlignmentDirectional.centerStart,
                        ),
                        DropdownMenuItem(
                          value: Goal.gain_weight,
                          child: Text('Gain Weight'),
                          alignment: AlignmentDirectional.centerStart,
                        ),
                      ], 
                      onChanged: ((value) => setState(() {
                        goal = value!;
                        print("gender - $gender");
                        })
                      ),
                      ),

                    SizedBox(height: 20.0),

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
                      visible: goal == Goal.maintain_weight ? false : true,
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
                    if(goal != Goal.maintain_weight)               
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
                        
                    SizedBox(height: 20.0),

                    // Register
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[400]),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                          ),
                        onPressed: () async {
            
                          // Checking whether if all validators are having null value (pass validations)
                          if(_formKey.currentState!.validate()){    
                            
                            setState(() {
                              this.loading = true;
                            });
                            
                            dynamic result = await _auth.registerWithEmailAndPassword(
                              username,
                              email, 
                              password,
                              age,
                              weight,
                              height,
                              goal!,
                              goal_weight,
                              weightChgPerWeek.toString(),
                              date_of_birth,
                              gender,
                              );
            
            
            
                            print("register: $result");
            
                            if (result==null){
                              setState(() {
                                this.error = "Please supply a valid email";      
                                this.loading = false                ;
                              });
                            }

                          }
                          
                        },
                        
                      ),
            
                    SizedBox(height: 12.0,),
          
                    Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),

                  ],
                ),
                )

    
      
              ]
            ),
            )
        ),
      ),
    );
  }
}