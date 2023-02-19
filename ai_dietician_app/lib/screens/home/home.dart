import 'package:ai_dietician_app/shared/btmNavBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final BtmNavBar custNavBar = BtmNavBar();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      bottomNavigationBar: BtmNavBar(),
    );
  }
}