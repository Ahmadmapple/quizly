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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final double imageSize = (screenWidth * 0.35).clamp(100.0, 180.0);

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF161320) : const Color(0xFFEEE5F8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/Assets/Ikon Q Ungu Berlapis Modern.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Text(
                  "quizly",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontFamily: "Manrope",
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
