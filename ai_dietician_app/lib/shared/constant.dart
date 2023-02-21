import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  // Normal Border
                  enabledBorder: OutlineInputBorder(      
                    borderSide: BorderSide(color: Colors.white, width: 2.0)
                  ),
                  // Border when selected
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2.0)
                  )
                );