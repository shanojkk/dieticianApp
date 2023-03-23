import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(
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
      
      return await userCollection.doc(uid).set({
        'username' : username,
        'email' : email,
        'password': password,
        'age' : age,
        'current_weight' : current_weight,
        'current_height' : current_height,
        'goal' : goal.toString(),
        'goal_weight' : goal_weight,
        'weight_chg_per_week' : weight_chg_per_week,
        'date_of_birth' : date_of_birth,
        'gender' : gender.toString(),
      });
    }

  
  Future updateUserSingleData(String dataToUpdate, DatabaseValue updateData) async {    
    return await userCollection.doc(uid).update({
      dataToUpdate : updateData.getValue
    });
  }



  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){

    return UserData(
      uid : uid,
      username : snapshot.get('username'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
      age : snapshot.get('age'),
      current_weight : snapshot.get('current_weight'),
      current_height : snapshot.get('current_height'),
      goal : Goal.values.firstWhere((e) => e.toString() == snapshot.get('goal'),),
      goal_weight: snapshot.get('goal_weight'),
      weight_chg_per_week: snapshot.get('weight_chg_per_week'),
      date_of_birth: snapshot.get('date_of_birth').toDate(),
      gender :  Gender.values.firstWhere((e) => e.toString() == snapshot.get('gender'),),
      
      
      );
  }


  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }


   // brew list from snapshot, as QuerySnapshot is passed as parameter here, all streams in this project no longer
  // listens directly to QuerySnapshot but instead listens to List<Brew>
  // List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc){
  //     return Brew(
  //       name: doc.get('name') ?? '',
  //       sugars: doc.get('sugars') ?? '0',
  //       strength: doc.get('strength') ?? 0,
  //       );
  //   }).toList();
  // }

  
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots()
  //   .map(_brewListFromSnapshot);  // Return a stream with processed list of brew
  // }




}

