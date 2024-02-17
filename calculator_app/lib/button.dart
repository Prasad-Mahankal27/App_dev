import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText; 
  const Button({required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(46, 49, 146, 1),
              Color.fromRGBO(27, 255, 255, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        height: 40,
        width: 90,
        child: Center(
          child: Text(
            buttonText, // Use the passed string here
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
