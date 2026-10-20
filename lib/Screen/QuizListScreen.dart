import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizly/Data/dummy_data.dart';

import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';
import '../Widgets/QuizListCard.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  final int _currentIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF29243A);
    const subtitleColor = Color(0xFF8A8199);
    const labelColor = Color(0xFF9560C5);

    final String query = _searchController.text.trim().toLowerCase();
    final filteredQuizzes = dummyQuizzes.where((quiz) {
      if (query.isEmpty) return true;
      return quiz.title.toLowerCase().contains(query) ||
          quiz.description.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      appBar: const TopBar(title: "quizly"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TEMUKAN PENGETAHUAN BARU',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                color: labelColor,
              ),
            ),
            const SizedBox(height: 6),

            const Text(
              'Semua kuis.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),

            const Text(
              'Pilih kuis yang menarik dan uji wawasanmu.',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 13,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEAE5EF)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Cari kuis...',
                  hintStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 13,
                    color: Color(0xFFA099AE),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFA099AE),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              '${filteredQuizzes.length} kuis tersedia',
              style: const TextStyle(
                fontFamily: 'DMSans',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 16),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredQuizzes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final quiz = filteredQuizzes[index];
                return QuizListCard(
                  title: quiz.title,
                  description: quiz.description,
                  icon: quiz.icon,
                  iconColor: quiz.iconColor,
                  iconBackgroundColor: quiz.iconBackgroundColor,
                  questionCount: quiz.questionCount,
                  onTap: () {
                    context.go(
                      '/namescreen',
                      extra: {
                        'title': quiz.title,
                        'description': quiz.description,
                        'icon': quiz.icon,
                        'iconColor': quiz.iconColor,
                        'iconBackgroundColor': quiz.iconBackgroundColor,
                        'questionCount': quiz.questionCount,
                      },
                    );
                  },
                );
              },
            ),
          ],
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
