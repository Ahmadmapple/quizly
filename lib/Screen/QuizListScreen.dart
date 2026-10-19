import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  // Controller for the search field
  final TextEditingController _searchController = TextEditingController();

  // Sample data corresponding to the cards in the design
  final List<Map<String, dynamic>> _quizzes = [
    {
      'title': 'Seberapa luas wawasanmu?',
      'description': 'Jelajahi fakta menarik dari berbagai penjuru dunia.',
      'icon': Icons.language,
      'iconColor': const Color(0xFF437B62),
      'iconBackgroundColor': const Color(0xFFE4F0E8),
      'questionCount': 10,
    },
    {
      'title': 'Kenali dunia digital',
      'description': 'Dari internet sampai coding. Seberapa tech-savvy kamu?',
      'icon': Icons.code,
      'iconColor': const Color(0xFF8B60A9),
      'iconBackgroundColor': const Color(0xFFECE4F8),
      'questionCount': 10,
    },
    {
      'title': 'Rahasia di balik sains',
      'description': 'Temukan keajaiban sains dalam kehidupan sehari-hari.',
      'icon': Icons.science_outlined,
      'iconColor': const Color(0xFFB07233),
      'iconBackgroundColor': const Color(0xFFF9EEDD),
      'questionCount': 10,
    },
  ];

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

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC), // Clean, light background as seen in design
      appBar: const TopBar(title: "quizly"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Subtitle / Tagline
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

            // Main Screen Title
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

            // Description Header
            const Text(
              'Pilih kuis yang menarik dan uji wawasanmu.',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 13,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEAE5EF)),
              ),
              child: TextField(
                controller: _searchController,
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

            // Summary text info
            const Text(
              '3 kuis tersedia',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 16),

            // Quiz Cards List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _quizzes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final quiz = _quizzes[index];
                return QuizListCard(
                  title: quiz['title'],
                  description: quiz['description'],
                  icon: quiz['icon'],
                  iconColor: quiz['iconColor'],
                  iconBackgroundColor: quiz['iconBackgroundColor'],
                  questionCount: quiz['questionCount'],
                  onTap: () {
                    // Navigate to quiz details or quiz screen
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