import 'package:ai_dietician_app/models/user.dart';
import 'package:ai_dietician_app/screens/authenticate/starting/starting.dart';
import 'package:ai_dietician_app/screens/home/home.dart';
import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:ai_dietician_app/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DieticianApp());
}

class DieticianApp extends StatelessWidget {
  const DieticianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(   // StreamProvider allows the widgets below to access the value from the Stream
      value: AuthService().user,            // Setup stream between Flutter App and Firebase
      initialData: null,
      child: MaterialApp(
        home: Starting(),
      ),
    );
  }
}