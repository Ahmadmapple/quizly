import 'package:flutter/material.dart';

class HistoryItem {
  final int id;
  final String title;
  final String userName;
  final String date;
  final int score;
  final int maxScore;
  final int correctCount;
  final int totalQuestions;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;

  HistoryItem({
    required this.id,
    required this.title,
    required this.userName,
    required this.date,
    required this.score,
    this.maxScore = 100,
    required this.correctCount,
    this.totalQuestions = 10,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
  });
}

class HistoryProvider extends ChangeNotifier {
  final List<HistoryItem> _historyList = [];
  int _nextId = 1;

  List<HistoryItem> get historyList => List.unmodifiable(_historyList);

  bool get isEmpty => _historyList.isEmpty;

  void addHistory({
    required String title,
    required String userName,
    required String date,
    required int score,
    int maxScore = 100,
    required int correctCount,
    int totalQuestions = 10,
    required IconData icon,
    required Color iconColor,
    required Color iconBackgroundColor,
  }) {
    final item = HistoryItem(
      id: _nextId++,
      title: title,
      userName: userName,
      date: date,
      score: score,
      maxScore: maxScore,
      correctCount: correctCount,
      totalQuestions: totalQuestions,
      icon: icon,
      iconColor: iconColor,
      iconBackgroundColor: iconBackgroundColor,
    );
    _historyList.insert(0, item);
    notifyListeners();
  }

  void addHistoryItem(HistoryItem item) {
    _historyList.insert(0, item);
    notifyListeners();
  }

  void clearHistory() {
    _historyList.clear();
    _nextId = 1;
    notifyListeners();
  }
}
