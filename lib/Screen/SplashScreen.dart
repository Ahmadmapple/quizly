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
    return Scaffold(
      backgroundColor: Color(0xFFEEE5F8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100), // Applies padding to the entire group
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/Assets/Ikon Q Ungu Berlapis Modern.png',
                width: 200,
                fit: BoxFit.contain,
              ),
              const Text(
                "Quizly",
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
