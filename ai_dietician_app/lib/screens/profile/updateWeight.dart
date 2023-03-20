// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class UpdateWeight extends StatefulWidget {

  String weight;
  String dataToUpdate;
  final user;

  UpdateWeight({required this.weight, required this.dataToUpdate, required this.user});

  @override
  State<UpdateWeight> createState() => _UpdateWeightState();
}

class _UpdateWeightState extends State<UpdateWeight> {

  late int? weight = null;

  @override
  Widget build(BuildContext context) {

    if(weight == null){
      setState(() {
      weight = int.parse(widget.weight);
    });
    }    

    return Dialog(
      child: Container(
        height: 160.0,
        margin: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Weight Tracking", style: TextStyle(fontSize: 20.0)),
    
            SizedBox(height: 20.0,),
    
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    weight = weight! - 1;
                  });
                },                
                ),
              
              title: Text("$weight KG", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
    
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    weight = weight! + 1;
                  });
                  print(weight);
                },                
                ),
            ),

            SizedBox(height: 10.0,),

            ElevatedButton(            
              onPressed:() {
                DatabaseValue <String> genericWeight = DatabaseValue(weight.toString());
                DatabaseService(uid: widget.user.uid).updateUserSingleData(widget.dataToUpdate, genericWeight);
                widget.weight = weight.toString();
                Navigator.of(context).pop(widget.weight);
              },
    
              child: Text("UPDATE WEIGHT"),
    
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 70.0)
              ),
    
              )
          ]
          ,)
      ),
    );
  }
}