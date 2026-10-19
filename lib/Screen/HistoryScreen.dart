import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/TopBar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  final int _currentIndex = 2;

  // Jika list ini kosong [], maka tampilan akan berubah menjadi Empty State (Gambar 1).
  final List<Map<String, dynamic>> _historyList = [
    {
      'title': 'Seberapa luas wawasanmu?',
      'author': 'Caesar',
      'date': '19 Oktober 2026',
      'score': 40,
      'maxScore': 100,
      'icon': Icons.language,
      'iconColor': const Color(0xFF437B62),
      'iconBackgroundColor': const Color(0xFFE4F0E8),
    },
  ];

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF29243A);
    const subtitleColor = Color(0xFF8A8199);
    const labelColor = Color(0xFF9560C5);
    const purplePrimary = Color(0xFF8C62B5);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      appBar: const TopBar(title: "quizly"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Label
            const Text(
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

            // Main Title
            const Text(
              'Perjalanan belajarmu.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),

            // Subtitle
            const Text(
              'Semua kuis dan skor yang sudah kamu selesaikan.',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 13,
                color: subtitleColor,
              ),
            ),
            const SizedBox(height: 24),

            // Kondisi jika riwayat kosong vs ada riwayat
            _historyList.isEmpty
                ? _buildEmptyState(context, purplePrimary, textColor, subtitleColor)
                : _buildHistoryList(textColor, subtitleColor),
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

  // WIDGET TAMPILAN JIKA BELUM ADA RIWAYAT (GAMBAR 1)
  Widget _buildEmptyState(
      BuildContext context,
      Color purpleColor,
      Color textColor,
      Color subtitleColor,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEAE5EF)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circle Icon History
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF2EBF9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.history_rounded,
              color: Color(0xFF8C62B5),
              size: 32,
            ),
          ),
          const SizedBox(height: 20),

          // Title
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

          // Subtitle Text
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

          // Button "Temukan kuis"
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
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET TAMPILAN DAFTAR RIWAYAT KUIS (GAMBAR 2)
  Widget _buildHistoryList(Color textColor, Color subtitleColor) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _historyList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = _historyList[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEAE5EF)),
          ),
          child: Row(
            children: [
              // Icon Kuis
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item['iconBackgroundColor'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item['icon'],
                  color: item['iconColor'],
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),

              // Title & Date Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${item['author']} · ${item['date']}',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 10,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Score Display
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${item['score']}',
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8C62B5),
                    ),
                  ),
                  Text(
                    '/${item['maxScore']}',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 9,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),

              // Arrow Icon
              Icon(
                Icons.chevron_right,
                size: 18,
                color: subtitleColor,
              ),
            ],
          ),
        );
      },
    );
  }
}