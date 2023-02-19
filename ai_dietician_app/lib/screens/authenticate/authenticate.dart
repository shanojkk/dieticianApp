import 'package:ai_dietician_app/screens/authenticate/login.dart';
import 'package:ai_dietician_app/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signIn = true;

  void toggleView(){
    setState(() {
      signIn = !signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(signIn){
      return Login();
    }
    else{
      return Register();
    }
  }
}