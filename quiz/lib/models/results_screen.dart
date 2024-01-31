import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({super.key, required this.chosenAnswers});

final List<String> chosenAnswers;

List<Map<String, Object>> getSummaryData(){
final List<Map<String, Object>> summary =[];

for(var i=0;i<chosenAnswers.length;i++){
summary.add({
'question_index': i,
'question': questions[i].text,
'correct_answer': questions[i].answers[0],
'user_answer': chosenAnswers[i],
});
}
return summary;
}

  @override
  Widget build(BuildContext context){
    final summaryData=getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions =summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //return true or false for each question to where as a list and find the length of list which contains true values

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',),
              const SizedBox(height: 30,),
              QuestionsSummary(getSummaryData()),
              const Text('List of answers and questions...'),
              const SizedBox(height: 30,),
          TextButton(onPressed: (){
            
          }, child: const Text('Restart Quiz!'),
          ),
            ]),
        ),
      ),
    );
  }
}