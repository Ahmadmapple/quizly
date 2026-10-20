import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../Provider/HistoryProvider.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF161320) : const Color(0xFFFAFAFC);
    final textColor =
        isDark ? const Color(0xFFF4F0FB) : const Color(0xFF29243A);
    final subtitleColor =
        isDark ? const Color(0xFFAFA5C2) : const Color(0xFF8A8199);
    final labelColor =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF9560C5);
    final purplePrimary =
        isDark ? const Color(0xFFB382EA) : const Color(0xFF8C62B5);

    final historyProvider = context.watch<HistoryProvider>();
    final historyList = historyProvider.historyList;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(title: "quizly"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SETIAP LANGKAH BERARTI',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                color: labelColor,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              'Perjalanan belajarmu.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              'Semua kuis dan skor yang sudah kamu selesaikan.',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 13,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 24),

            historyList.isEmpty
                ? _buildEmptyState(
                    context,
                    purplePrimary,
                    textColor,
                    subtitleColor,
                  )
                : _buildHistoryList(historyList, textColor, subtitleColor),
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

  Widget _buildEmptyState(
    BuildContext context,
    Color purpleColor,
    Color textColor,
    Color subtitleColor,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF231F33) : Colors.white;
    final borderColor =
        isDark ? const Color(0xFF38314A) : const Color(0xFFEAE5EF);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2E2640) : const Color(0xFFF2EBF9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.history_rounded,
              color: purpleColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Cerita belajarmu dimulai di sini.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            'Selesaikan kuis pertamamu dan lihat progresmu bertumbuh.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 12,
              height: 1.4,
              color: subtitleColor,
            ),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              context.go('/quizlist');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: purpleColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Temukan kuis',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 16, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(
    List<HistoryItem> historyList,
    Color textColor,
    Color subtitleColor,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF231F33) : Colors.white;
    final borderColor =
        isDark ? const Color(0xFF38314A) : const Color(0xFFEAE5EF);
    final scoreColor =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF8C62B5);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: historyList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = historyList[index];

        final effectiveIconBg = isDark
            ? Color.alphaBlend(
                item.iconColor.withValues(alpha: 0.25),
                const Color(0xFF2E2742),
              )
            : item.iconBackgroundColor;

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: effectiveIconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(item.icon, color: item.iconColor, size: 26),
              ),
              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Nama: ${item.userName}',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: textColor.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${item.date} · ${item.correctCount}/${item.totalQuestions} benar',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 10,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${item.score}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: scoreColor,
                    ),
                  ),
                  Text(
                    '/${item.maxScore} poin',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 9,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
