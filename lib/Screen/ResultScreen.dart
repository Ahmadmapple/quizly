import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int maxScore;
  final int correctCount;
  final int totalQuestions;
  final String title;

  const ResultScreen({
    super.key,
    this.userName = 'Pengguna',
    this.score = 20,
    this.maxScore = 100,
    this.correctCount = 2,
    this.totalQuestions = 10,
    this.title = 'Seberapa luas wawasanmu?',
  });

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF29243A);
    const subtitleColor = Color(0xFF8A8199);
    const primaryPurple = Color(0xFF8C62B5);
    const labelColor = Color(0xFF9560C5);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFFEAE5EF)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Trophy Icon
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBF2E0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.emoji_events_outlined,
                      color: Color(0xFFC09440),
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Tagline Label
                  const Text(
                    'SATU LANGKAH LEBIH TAHU',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: labelColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Encouragement Title
                  Text(
                    'Terus semangat, $userName!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Encouragement Subtitle
                  const Text(
                    'Setiap percobaan adalah kesempatan untuk belajar hal baru.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12,
                      height: 1.4,
                      color: subtitleColor,
                    ),
                  ),
                  const SizedBox(height: 80),

                  // Circular Score Badge
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFC4A5EE),
                        width: 2.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryPurple.withValues(alpha: 0.08),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$score',
                          style: const TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple,
                          ),
                        ),
                        const Text(
                          'dari 100 poin',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 11,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Quiz Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check,
                        size: 14,
                        color: subtitleColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$correctCount jawaban benar',
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 11,
                          color: subtitleColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.menu_book_outlined,
                        size: 14,
                        color: subtitleColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$totalQuestions pertanyaan',
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 11,
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),

                  // Buttons Row: [Kembali ke beranda] & [Coba lagi ->]
                  Row(
                    children: [
                      // Button 1: Kembali ke beranda
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () {
                              context.go('/home');
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFFD8C5F0),
                                width: 1.5,
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Kembali ke beranda',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: primaryPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Button 2: Coba lagi ->
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/quiz', extra: {
                                'userName': userName,
                                'title': title,
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryPurple,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Coba lagi',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
