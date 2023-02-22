import 'package:ai_dietician_app/screens/services/auth.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyAppBar extends StatefulWidget {

  final String title;
  final Color backgroundColor;
  final bool centerTitle;

  const MyAppBar({    
    required this.title,
    this.backgroundColor = Colors.blue,
    this.centerTitle = false,
  }) ;


  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.backgroundColor,
      centerTitle: widget.centerTitle,
      actions: <Widget>[
          ElevatedButton.icon(
            onPressed:() async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout), 
            label: Text('logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[400], 
              elevation: 0.0
              ),
            )
        ],
    );
  }
}

// final AuthService _auth = AuthService();

// var myAppBar = AppBar(actions: <Widget>[
//           ElevatedButton.icon(
//             onPressed:() async {
//               await _auth.signOut();
//             },
//             icon: Icon(Icons.logout), 
//             label: Text('logout'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.brown[400], 
//               elevation: 0.0
//               ),
//             )
//         ],);