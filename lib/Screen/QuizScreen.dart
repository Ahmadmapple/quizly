import 'package:flutter/material.dart';
import '../Widgets/TopBar.dart';

class QuizScreen extends StatelessWidget {
  final String userName;
  final String title;

  const QuizScreen({
    super.key,
    this.userName = '',
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      appBar: const TopBar(title: 'quizly'),
      body: Center(
        child: Text(
          userName.isNotEmpty ? 'Kuis dimulai untuk $userName!' : 'Kuis',
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
