import 'package:go_router/go_router.dart';

import '../Screen/HistoryScreen.dart';
import '../Screen/HomeScreen.dart';
import '../Screen/QuizListScreen.dart';
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
  ],
);
