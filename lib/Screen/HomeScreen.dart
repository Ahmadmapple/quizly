import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizly/Data/dummy_data.dart';
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryPurple =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF9363C5);
    final backgroundColor =
        isDark ? const Color(0xFF161320) : const Color(0xFFFAF9FC);
    final textColor =
        isDark ? const Color(0xFFF4F0FB) : const Color(0xFF29243A);
    final mutedColor =
        isDark ? const Color(0xFFAFA5C2) : const Color(0xFF9387A5);

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

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih kuismu',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '10 pertanyaan, satu pengetahuan baru.',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 10,
                            color: mutedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => context.go('/quizlist'),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Text(
                            'Semua',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 10,
                              color: primaryPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
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

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyQuizzes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final quiz = dummyQuizzes[index];
                  return QuizListCard(
                    icon: quiz.icon,
                    iconColor: quiz.iconColor,
                    iconBackgroundColor: quiz.iconBackgroundColor,
                    title: quiz.title,
                    description: quiz.description,
                    questionCount: quiz.questionCount,
                    onTap: () => context.go(
                      '/namescreen',
                      extra: {
                        'title': quiz.title,
                        'description': quiz.description,
                        'icon': quiz.icon,
                        'iconColor': quiz.iconColor,
                        'iconBackgroundColor': quiz.iconBackgroundColor,
                        'questionCount': quiz.questionCount,
                      },
                    ),
                  );
                },
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
