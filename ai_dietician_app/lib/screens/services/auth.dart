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
  Future signInWithEmailAndPassword (String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email & password

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


}



