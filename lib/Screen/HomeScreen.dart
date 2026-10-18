import 'package:flutter/material.dart';

import '../Widgets/TopBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE5F8),
      appBar: const TopBar(title: "Quizly"),
      body: Center(child: Text("This screen has an AppBar")),
    );
  }
}
