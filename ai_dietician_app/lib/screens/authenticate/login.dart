// ignore_for_file: prefer_const_constructors

import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  // text field state variable
  String email = "";
  String password = "";
  String error = "";


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[700],      
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Login to AI Dietician'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black,),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Register", style: TextStyle(color: Colors.black)),
            )
        ],
        ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(()=> email = val);
                }
              ),

              SizedBox(height: 20.0),
              
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (val) => val!.isEmpty ? 'Enter a password 6+ chars' : null,
                obscureText: true,
                onChanged: (val){
                  setState(()=> password = val);
                }
              ),

              SizedBox(height: 20.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      this.loading = true;
                    });

                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                    if (result == null){
                      setState(() {
                        this.error = "Could not sign in with those credentials";
                        this.loading = false;
                      });
                    }
                    print("Email: " + email);
                    print("Password: " + password);

                  }

                },
                ),

            ]
            ),
        ),
      ),
    );
  }
}