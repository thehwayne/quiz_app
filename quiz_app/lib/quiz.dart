import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//Stateful widget
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; //Keeps track of user answers
  Widget? activeScreen;

//
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      final answers = List.of(selectedAnswers); // Makes copy of the answers for the results
      setState(() {
        selectedAnswers = []; // Clear list for next run
        activeScreen = ResultsScreen( //Switch to results screen
          chosenAnswers: answers,
          onRestart: restartQuiz,
        );
      });
    }
  }
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen); //Start screen
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen( //Questions screen
        onSelectedAnswer: chooseAnswer, 
      );
    });
  }


//Restart function
  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }


//UI stuff
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Colors.blue,
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
