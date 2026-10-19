import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizly/Widgets/BuildBanner.dart';
import 'package:quizly/Widgets/QuizListCard.dart';

import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  static const Color primaryPurple = Color(0xFF9363C5);
  static const Color backgroundColor = Color(0xFFFAF9FC);
  static const Color textColor = Color(0xFF29243A);
  static const Color mutedColor = Color(0xFF9387A5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(title: 'quizly'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildBanner(),

              const SizedBox(height: 26),

              // Header pilihan kuis
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih kuismu',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '10 pertanyaan, satu pengetahuan baru.',
                          style: TextStyle(fontSize: 10, color: mutedColor),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => context.go('/quizlist'),
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Text(
                            'Semua',
                            style: TextStyle(
                              fontSize: 10,
                              color: primaryPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: primaryPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Kategori kuis 1
              QuizListCard(
                icon: Icons.language,
                iconColor: const Color(0xFF6E9F88),
                iconBackgroundColor: const Color(0xFFE7F1EB),
                title: 'Seberapa luas wawasanmu?',
                description:
                'Jelajahi fakta menarik dari berbagai penjuru dunia.',
                questionCount: 10,
                onTap: () => context.go('/quizlist'),
              ),

              const SizedBox(height: 12),

              // Kategori kuis 2
              QuizListCard(
                icon: Icons.code,
                iconColor: const Color(0xFF9C7BD0),
                iconBackgroundColor: const Color(0xFFF0E8FA),
                title: 'Kenali dunia digital',
                description:
                'Dari internet sampai coding. Seberapa tech-savvy kamu?',
                questionCount: 10,
                onTap: () => context.go('/quizlist'),
              ),

              const SizedBox(height: 12),

              // Kategori kuis 3
              QuizListCard(
                icon: Icons.science_outlined,
                iconColor: const Color(0xFFD5A071),
                iconBackgroundColor: const Color(0xFFFAF0E5),
                title: 'Rahasia di balik sains',
                description:
                'Temukan keajaiban sains dalam kehidupan sehari-hari.',
                questionCount: 10,
                onTap: () => context.go('/quizlist'),
              ),
            ],
          ),
        ),
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