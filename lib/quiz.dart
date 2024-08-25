import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

const Color color1 = Color.fromARGB(255, 3, 70, 157);
const Color color2 = Color.fromARGB(217, 107, 187, 244);

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // final List<String> selectedAnswers = [];
  List<String> selectedAnswers = []; //因應重置答案要重新宣告，故不能用final

  // var activeScreen = const StartScreen(); 這裡會自動把activeScreen型別變為StartScreen的
  // Widget? activeScreen; //注意 宣告要用Widget放寬條件
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = 'start-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choiceAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidge = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidge = QuestionsScreen(onSelectAnswer: choiceAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidge = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidge,
        ),
      ),
    );
  }
}
