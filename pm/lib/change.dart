import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({super.key});
  @override
  State<Change> createState() {
    return _changeState();
  }
}

// ignore: camel_case_types
class _changeState extends State<Change> {
  var img = "assets/download.png";
  void change() {
    setState(() {
      img = "assets/Screenshot (61).png";
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            width: 200,
          ),
           TextButton(
              onPressed: change,
              child: const Text(
                "CHANGE IMG",
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
