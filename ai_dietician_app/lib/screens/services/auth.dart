import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
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



  // sign in with email & password
  Future signInWithEmailAndPassword (String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print("login: $user");
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword (
    String username, 
    String email, 
    String password, 
    int age,
    String current_weight,
    String current_height,
    Goal goal,
    String goal_weight,
    String weight_chg_per_week,
    DateTime date_of_birth,
    Gender gender
    ) async {
              try{
                UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                User? user = result.user;
                print("register: $user");
                // create a new doc for the user with uid generated by firebase
                await DatabaseService(uid: user!.uid).updateUserData(
                    username,
                    email,
                    password,
                    age,
                    current_weight,
                    current_height,
                    goal,
                    goal_weight,
                    weight_chg_per_week,
                    date_of_birth,
                    gender,
                  );
                print("register2: $user");

                return _userFromFirebaseUser(user);  
              }
              catch(e){
                print("auth: $e");
                
                return null;
              }
  }

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



