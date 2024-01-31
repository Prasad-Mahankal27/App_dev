import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
var currentQuestionIndex=0;

  void answerQuestions(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
  setState((){
  currentQuestionIndex++;
    });
}//updating question using setstate

  @override
  Widget build(context) {
final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,//covers all page
      child: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Text(currentQuestion.text, style: GoogleFonts.frankRuhlLibre(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestions(answer);
              });
            }),
            /*...currentQuestion.answers.map((answer){
              return AnswerButton(answerText: answer, onTap: (){});
            }),*/
          /*AnswerButton(onTap: () {
            
          },answerText: currentQuestion.answers[0],),
          AnswerButton(onTap: () {
            
          },answerText: currentQuestion.answers[1],),
          AnswerButton(onTap: (){
        
          }, answerText: currentQuestion.answers[2],),
          AnswerButton(onTap: (){
        
          }, answerText: currentQuestion.answers[3],),*/
          ],
        ),
      ),
    );
  }
}
