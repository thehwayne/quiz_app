import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';


//Stateless widget for results screen
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart; //This is needed for restart function

  final List<String> chosenAnswers;// Keeps list of user answers


//Builds summary with index of question, question text, the correct answer, and the user's answer
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }


//UI stuff
  @override
  Widget build(context) {
  final summaryData = getSummaryData(); 

//This figures out how many the user got right and how many questions there are (in total, 6)
  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
  ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox( //Sized box and added scrolling capability
              height: 300,
              child: SingleChildScrollView( //used this as reference https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
                child: QuestionsSummary(summaryData: getSummaryData()),
              )
            ),
            TextButton(
              onPressed: onRestart,
              child: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


