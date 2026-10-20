import 'package:flutter/material.dart';

class QuizListCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  final int questionCount;
  final VoidCallback? onTap;

  const QuizListCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.description,
    this.questionCount = 10,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final purple = isDark ? const Color(0xFFC099EA) : const Color(0xFF9560C5);
    final borderColor =
        isDark ? const Color(0xFF38314A) : const Color(0xFFEAE5EF);
    final textColor = isDark ? const Color(0xFFF4F0FB) : const Color(0xFF29243A);
    final mutedColor =
        isDark ? const Color(0xFFAFA5C2) : const Color(0xFF8A8199);
    final cardColor = isDark ? const Color(0xFF231F33) : Colors.white;

    final effectiveIconBg = isDark
        ? Color.alphaBlend(
            iconColor.withValues(alpha: 0.25), const Color(0xFF2E2742))
        : iconBackgroundColor;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 61,
                decoration: BoxDecoration(
                  color: effectiveIconBg,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 27,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 10,
                        height: 1.5,
                        color: mutedColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.menu_book_outlined,
                          size: 12,
                          color: mutedColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$questionCount pertanyaan',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 9,
                            color: mutedColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            thickness: 1,
            color: borderColor,
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mulai kuis',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: purple,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 17,
                    color: purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
