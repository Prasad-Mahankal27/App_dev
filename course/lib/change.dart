import 'package:flutter/material.dart';
import 'dart:math';

class Change extends StatefulWidget {
  const Change({super.key});
  @override
  State<Change> createState() {
    return _changeState();
  }
}

// ignore: camel_case_types
class _changeState extends State<Change> {
  
  var img = ".dart_tool/assets/download.png";
  void change() {
    if(img == ".dart_tool/assets/download.png"){
    setState(() {
      Image.asset(
        img = ".dart_tool/assets/audi.jpg",
      );
    });
    }else{
      setState(() {
      Image.asset(
        img = ".dart_tool/assets/download.png",
      );
    });
    }
  }// for changing image

  var a = 0;
  void numb() {
    setState(() {
      a = Random().nextInt(2) + 1;
    });
  } //for changing numbers over text button

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
          ElevatedButton(onPressed: numb, child: Text("$a")),
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
