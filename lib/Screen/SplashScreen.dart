import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFEEE5F8),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/Assets/Ikon Q Ungu Berlapis Modern.png',
                width: screenWidth * 0.5,
                fit: BoxFit.contain,
              ),
              const Text(
                "quizly",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Manrope",
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
