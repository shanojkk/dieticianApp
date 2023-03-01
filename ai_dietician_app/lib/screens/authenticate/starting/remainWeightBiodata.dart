import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/shared/constant.dart';
import 'package:flutter/material.dart';

class RemainWeightBiodata extends StatefulWidget {
  const RemainWeightBiodata({super.key});

  @override
  State<RemainWeightBiodata> createState() => _RemainWeightBiodataState();
}

class _RemainWeightBiodataState extends State<RemainWeightBiodata> {
  
  DateTime _currentDate = DateTime.now();

  late Gender? gender;
  late DateTime date_of_birth;
  late String height;
  late String weight;

  final _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Remain Weight"),
      ),
      backgroundColor: Colors.green[700],

      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
          
                // Gender Picker                
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: Gender.male,
                  items: <DropdownMenuItem<Gender>>[
                    DropdownMenuItem(
                      value: Gender.female,
                      child: Text('Female'),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    DropdownMenuItem(
                      value: Gender.male,
                      child: Text('Male'),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                  ], 
                  onChanged: ((value) => setState(() {
                    gender = value;
                    print("gender - $gender");
                    })
                  ),
                  ),
          
                SizedBox(height: 20.0,),
          
                // Date of Birth Picker
                Text(
                  '${_currentDate.year}/${_currentDate.month}/${_currentDate.day}',
                  style: TextStyle(fontSize: 32.0),
                ),

                ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context, 
                      initialDate: _currentDate, 
                      firstDate: DateTime(1900), 
                      lastDate: DateTime(2100),
                      );

                    if(newDate == null) return;

                    setState(() {
                      date_of_birth = newDate;
                      _currentDate = newDate;
                    });
                  }, 
                  child: Text('Select Date of Birth'),
                  ),               

                SizedBox(height: 20.0,),

                // Height          
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Height',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid,
                    )
                  ),
                  suffixText: "CM",

                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (val) {
                    validateHeight(val!);
                  },
                  onChanged: (value) => setState(() {
                    height = value;
                  }),
                ),


                SizedBox(height: 20.0,),

                // Weight
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                  hintText: 'Weight',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid,
                    )
                  ),
                  suffixText: "KG",

                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (val) {
                    validateHeight(val!);
                  },
                  onChanged: (value) => setState(() {
                    weight = value;
                  }),
                ),

                SizedBox(height: 20.0,),

                
                
              ],
              ),
          ),
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {
          
        },
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 55.0, right: 55.0),
        )

        ),

    );
  }
}