import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  String _activeQuizTitle = '';
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};

  String get activeQuizTitle => _activeQuizTitle;
  int get currentIndex => _currentIndex;
  Map<int, int> get selectedAnswers => Map.unmodifiable(_selectedAnswers);

  void startQuiz(String title) {
    if (_activeQuizTitle.toLowerCase() != title.toLowerCase()) {
      _activeQuizTitle = title;
      _currentIndex = 0;
      _selectedAnswers.clear();
      notifyListeners();
    }
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    _selectedAnswers[questionIndex] = optionIndex;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void resetQuiz() {
    _currentIndex = 0;
    _selectedAnswers.clear();
    notifyListeners();
  }
}
