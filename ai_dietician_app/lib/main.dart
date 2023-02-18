import 'package:ai_dietician_app/screens/home/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DieticianApp());
}

class DieticianApp extends StatelessWidget {
  const DieticianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}