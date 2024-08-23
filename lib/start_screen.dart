import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(152, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter fun way!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 44, 67, 173),
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              'click me',
            ),
          )
        ],
      ),
    );
  }
}
