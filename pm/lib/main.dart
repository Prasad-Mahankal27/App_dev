import 'package:flutter/material.dart';
//import 'package:pm/change.dart';

var clr=Colors.white;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
         child: Image.asset(
          ".dart_tool/assets/download.png",
          width: 200,
         ),
        ),
      ),
    );
  }
}






