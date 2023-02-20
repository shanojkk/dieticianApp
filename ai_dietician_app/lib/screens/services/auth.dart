import 'package:ai_dietician_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user){
    return user != null ? MyUser(uid: user.uid) :null;
  }

  Stream<MyUser?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }


  // sign in anonymous

  // sign in with email & password

  // register with email & password

  // sign out


}



