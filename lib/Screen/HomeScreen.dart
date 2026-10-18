import 'package:flutter/material.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the currently selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE5F8),
      appBar: const TopBar(title: "quizly"),
      body: const Center(
        child: Text("This screen has an AppBar"),
      ),
      // Adding your BottomBar here
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Optional: Handle navigation between screens based on index
          // if (index == 1) { // Go to All Quizzes }
          // else if (index == 2) { // Go to History }
        },
      ),
    );
  }
}