import 'package:flutter/material.dart';

var clr = Colors.amber;

//constructor with key, override, context(necessary parameter), return widget
class TextDefault extends StatelessWidget {
  const TextDefault({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: clr,
      ),
      child: const Center(
        child: Text(
          'Prasad',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 232, 210, 13),
          ),
        ),
      ),
    );
  }
}
