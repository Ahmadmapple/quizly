import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE5F8),
      appBar: const TopBar(title: "quizly"),
      body: const Center(
        child: Text("This is History"),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
            context.go('/quizlist');
          } else if (index == 2) {
            context.go('/history');
          }
        },
      ),
    );
  }
}