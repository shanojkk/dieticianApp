import 'package:ai_dietician_app/screens/services/database.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {

  String title;
  String widgetValue;
  String dataToUpdate;
  final Function validation;
  final user;

  //const CustomeAlertDialog({super.key});
  CustomAlertDialog({required this.title, required this.widgetValue, required this.dataToUpdate, required this.validation, required this.user});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {

  final _formKey  = GlobalKey<FormState>();
  String? stateValue;

  @override
  Widget build(BuildContext context) {
    
    if(stateValue==null) stateValue = widget.widgetValue;

    return Container(      
      child: Form(
        key: _formKey,        
        child: AlertDialog(
          title: Text(widget.title),
          content: TextFormField(
            initialValue: stateValue ?? widget.widgetValue,
            validator: (value) => widget.validation(value!) ? null : "Please enter valid name without special characters",
            decoration: InputDecoration(errorMaxLines: 2),
            onChanged: (value){
              setState(() {
                stateValue = value;
              });
              
            },
          ),

          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Save the updated data value here
                if(_formKey.currentState!.validate()){
                  DatabaseValue <String> genericStateValue = DatabaseValue(stateValue!);
                  print("formkey: ${_formKey.currentState!.validate()}, Validate: ${widget.validation(stateValue!)}");
                  DatabaseService(uid: widget.user.uid).updateUserSingleData(widget.dataToUpdate, genericStateValue);
                  Navigator.of(context).pop(stateValue);
                }
                
              },
            ),
          ],
        ),
      )
      );
  }
}