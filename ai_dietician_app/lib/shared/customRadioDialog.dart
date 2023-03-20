import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class CustomGenderRadioDialog extends StatefulWidget {

  Gender? widgetValue;
  String dataToUpdate;
  final user;

  CustomGenderRadioDialog({required this.widgetValue, required this.dataToUpdate, required this.user});

  @override
  State<CustomGenderRadioDialog> createState() => _CustomGenderRadioDialogState();
}

class _CustomGenderRadioDialogState extends State<CustomGenderRadioDialog> {

  Gender? gender;

  @override
  Widget build(BuildContext context) {
    return Dialog(                                    
      child: Container(
        margin: EdgeInsets.all(25.0),
        height: 160.0,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Update Gender", textAlign: TextAlign.left, style: TextStyle(fontSize: 18.0)),
                                        
            SizedBox(height: 12.0),
                                        
            ListTile(
              leading: Radio(
                value: Gender.male, 
                groupValue: gender != null ? gender : widget.widgetValue,
                onChanged:(value) {
                  setState(() {
                    gender = value as Gender?;
                  });
                  DatabaseValue genericGender = DatabaseValue(gender.toString());
                  DatabaseService(uid: widget.user.uid).updateUserSingleData("gender", genericGender);
                },
              ),
              title: Text("Male"),
              onTap:() {
               
              },
            ),

                                        
            ListTile(
              leading: Radio(
                value: Gender.female, 
                groupValue: gender != null ? gender : widget.widgetValue,
                onChanged:(value) {
                  setState(() {
                    gender = value as Gender?;
                  });
                  DatabaseValue genericGender = DatabaseValue(gender.toString());
                  DatabaseService(uid: widget.user.uid).updateUserSingleData("gender", genericGender);
                },                                              
              ),
              title: Text("Female"),
              onTap: () {
                
              },
            ),
          ],
          ),
      ),
    );
  }
}