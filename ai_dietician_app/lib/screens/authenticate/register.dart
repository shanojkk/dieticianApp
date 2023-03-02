import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:ai_dietician_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey  = GlobalKey<FormState>();


  // text field state variable
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to AI Dietician'),
        actions: <Widget> [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Login", style: TextStyle(color:Colors.black)),
            ),
        ]
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 20.0,),

            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
              onChanged: (val){
                setState(() {
                  email = val;
                });
              },
            ),

            SizedBox(height: 20.0,),

            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (val){
                setState(() {
                  email = val;
                });
              },
              obscureText: true,
            ),

            SizedBox(height: 20.0),

            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[400]),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                  ),
                onPressed: () async {

                  setState(() {
                    this.loading = true;
                  });

                  // Checking whether if all validators are having null value (pass validations)
                  if(_formKey.currentState!.validate()){    
                    
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                    if (result==null){
                      setState(() {
                        this.error = "Please supply a valid email";      
                        this.loading = false                ;
                      });
                    }
                    print(email);
                    print(password);
                  }
                  
                },
                
              ),

              SizedBox(height: 12.0,),

              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),


            ]
          ),
          )
      ),
    );
  }
}