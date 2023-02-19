import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/authenticate.dart';
import 'package:ai_dietician_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<MyUser?>(context);

    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }

  }
}