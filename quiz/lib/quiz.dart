import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/models/results_screen.dart';

class Quiz extends StatefulWidget {
const Quiz({super.key});
@override
State<Quiz> createState(){
  return _QuizState(); 
}

}
class _QuizState extends State<Quiz>{
 List<String> selectedAnswers=[];
var activeScreen= 'start-screen';

void chooseAnswer(String answer){
  selectedAnswers.add(answer);

  if(selectedAnswers.length == questions.length){
setState(() {
  //selectedAnswers = [];
  activeScreen = 'results-screen';
});
  }//after questions end
}//answer parameter madhun gheun selectedAnswers list madhe takto


void switchScreen(){
  setState((){
    activeScreen = 'questions-screen';
  });
}//function for screen change

@override
Widget build(context){

  Widget screenWidget= StartScreen(switchScreen);
  if(activeScreen == 'results-screen'){
  screenWidget= ResultsScreen(chosenAnswers: selectedAnswers,);
}else if(activeScreen=='start-screen'){
  screenWidget= StartScreen(switchScreen);
}else{
  screenWidget= QuestionsScreen(onSelectAnswer : chooseAnswer);
}

  return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168),
        ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
        child: screenWidget,
      ),
    ),
  );
}
}