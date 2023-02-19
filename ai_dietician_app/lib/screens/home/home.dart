import 'package:ai_dietician_app/shared/btmNavBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      bottomNavigationBar: BtmNavBar(),
    );
  }
}