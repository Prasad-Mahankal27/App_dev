import 'package:course/change.dart';
import 'package:flutter/material.dart';

var clr=Colors.white;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
         child: Change(),
        ),
      ),
    );
  }
}

