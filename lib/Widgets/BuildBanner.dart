
import 'package:flutter/material.dart';
import 'AnswerLine.dart';

class BuildBanner extends StatelessWidget {
  const BuildBanner({super.key});

  static const Color primaryPurple = Color(0xFF9363C5);
  static const Color textColor = Color(0xFF29243A);
  static const Color mutedColor = Color(0xFF9387A5);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 184),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF0E7FA),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE8D9F6),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 100, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F5FF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 11,
                        color: mutedColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'BELAJAR JADI LEBIH SERU',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 7,
                          letterSpacing: 0.3,
                          color: mutedColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Rasa ingin tahu.',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 22,
                    height: 1.15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.7,
                    color: textColor,
                  ),
                ),
                const Text(
                  'Jadi lebih tahu.',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 22,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.7,
                    color: primaryPurple,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Satu kuis singkat.',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 10,
                    color: mutedColor,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Banyak hal baru untuk diketahui.',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 10,
                    color: mutedColor,
                  ),
                ),
              ],
            ),
          ),

          // Kartu jawaban
          Positioned(
            right: 25,
            bottom: 28,
            child: Transform.rotate(
              angle: -0.16,
              child: Container(
                width: 57,
                height: 78,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFCFAFF),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: const Color(0xFFD8C5F0),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 4,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCCAF4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const AnswerLine(),
                    const SizedBox(height: 4),
                    const AnswerLine(),
                    const SizedBox(height: 4),
                    const AnswerLine(),
                    const Spacer(),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check_circle,
                        size: 12,
                        color: Color(0xFFB9D9BE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Kartu tanda tanya
          Positioned(
            right: 1,
            bottom: 36,
            child: Transform.rotate(
              angle: 0.17,
              child: Container(
                width: 38,
                height: 47,
                decoration: BoxDecoration(
                  color: const Color(0xFF9472B7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.question_mark,
                  size: 34,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const Positioned(
            right: 76,
            bottom: 83,
            child: Icon(
              Icons.star,
              size: 18,
              color: Color(0xFFC4A5EE),
            ),
          ),
        ],
      ),
    );
  }
}
