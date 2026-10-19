import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Screen/HistoryScreen.dart';
import '../Screen/HomeScreen.dart';
import '../Screen/NameScreen.dart';
import '../Screen/QuizListScreen.dart';
import '../Screen/QuizScreen.dart';
import '../Screen/SplashScreen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/quizlist',
      builder: (context, state) => const QuizListScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/namescreen',
      builder: (context, state) {
        final extra = state.extra is Map ? (state.extra as Map) : null;
        if (extra != null) {
          return NameScreen(
            title: extra['title']?.toString() ?? 'Seberapa luas wawasanmu?',
            description: extra['description']?.toString() ??
                'Jelajahi fakta menarik dari berbagai penjuru dunia.',
            icon: extra['icon'] as IconData? ?? Icons.language,
            iconColor:
                extra['iconColor'] as Color? ?? const Color(0xFF437B62),
            iconBackgroundColor: extra['iconBackgroundColor'] as Color? ??
                const Color(0xFFE4F0E8),
            questionCount: (extra['questionCount'] as int?) ?? 10,
          );
        }
        return const NameScreen();
      },
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) {
        final extra = state.extra is Map ? (state.extra as Map) : null;
        return QuizScreen(
          userName: extra?['userName']?.toString() ?? '',
          title: extra?['title']?.toString() ?? '',
        );
      },
    ),
  ],
);
