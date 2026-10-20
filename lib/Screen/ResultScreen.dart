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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF161320) : const Color(0xFFFAFAFC);
    final cardColor = isDark ? const Color(0xFF231F33) : Colors.white;
    final borderColor =
        isDark ? const Color(0xFF38314A) : const Color(0xFFEAE5EF);
    final textColor =
        isDark ? const Color(0xFFF4F0FB) : const Color(0xFF29243A);
    final subtitleColor =
        isDark ? const Color(0xFFAFA5C2) : const Color(0xFF8A8199);
    final primaryPurple =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF8C62B5);
    final labelColor =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF9560C5);

    return Scaffold(
      backgroundColor: backgroundColor,
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
                color: cardColor,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF382F22)
                          : const Color(0xFFFBF2E0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.emoji_events_outlined,
                      color: Color(0xFFE5B252),
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 18),

                  Text(
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

                  Text(
                    'Terus semangat, $userName!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    'Setiap percobaan adalah kesempatan untuk belajar hal baru.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12,
                      height: 1.4,
                      color: subtitleColor,
                    ),
                  ),
                  const SizedBox(height: 22),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cardColor,
                      border: Border.all(
                        color: isDark
                            ? const Color(0xFF8B64BA)
                            : const Color(0xFFC4A5EE),
                        width: 2.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryPurple.withValues(alpha: 0.15),
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
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple,
                          ),
                        ),
                        Text(
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

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        size: 14,
                        color: subtitleColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$correctCount jawaban benar',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 11,
                          color: subtitleColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.menu_book_outlined,
                        size: 14,
                        color: subtitleColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$totalQuestions pertanyaan',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 11,
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () {
                              context.go('/home');
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: isDark
                                    ? const Color(0xFF4C3F66)
                                    : const Color(0xFFD8C5F0),
                                width: 1.5,
                              ),
                              backgroundColor: cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
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
