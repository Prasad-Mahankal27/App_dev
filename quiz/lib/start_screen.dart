import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
       ClipRRect(
        borderRadius: BorderRadius.circular(100),
         child: Image.asset(
           ".dart_tool/assets/images/quiz.jpg",
           width: 300
         ),
       ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Learn flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            "Start Quiz!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ]),
    );
  }
}
