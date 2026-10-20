import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Provider/HistoryProvider.dart';
import '../Provider/NameProvider.dart';
import '../Widgets/TopBar.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final int questionCount;

  const QuizScreen({
    super.key,
    this.userName = 'Pengguna',
    this.title = 'Seberapa luas wawasanmu?',
    this.description = 'Jelajahi fakta menarik dari berbagai penjuru dunia.',
    this.icon = Icons.language,
    this.iconColor = const Color(0xFF437B62),
    this.iconBackgroundColor = const Color(0xFFE4F0E8),
    this.questionCount = 10,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;

  final Map<int, int> _selectedAnswers = {};

  static const Color textColor = Color(0xFF29243A);
  static const Color subtitleColor = Color(0xFF8A8199);
  static const Color primaryPurple = Color(0xFF9363C5);
  static const Color palePurple = Color(0xFFD8CBEC);
  static const Color borderColor = Color(0xFFEAE5EF);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa nama ibu kota negara Jepang?',
      'options': ['Kyoto', 'Tokyo', 'Osaka', 'Hiroshima'],
      'correctAnswer': 1,
    },
    {
      'question': 'Berapa jumlah benua di dunia?',
      'options': ['5', '6', '7', '8'],
      'correctAnswer': 2,
    },
    {
      'question': 'Planet mana yang dikenal sebagai Planet Merah?',
      'options': ['Venus', 'Mars', 'Jupiter', 'Saturnus'],
      'correctAnswer': 1,
    },
    {
      'question': 'Siapa penemu lampu pijar?',
      'options': [
        'Nikola Tesla',
        'Thomas Edison',
        'Alexander Graham Bell',
        'Albert Einstein',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Hewan terdarat tertua yang masih hidup saat ini adalah?',
      'options': ['Gajah', 'Kura-kura raksasa', 'Paus biru', 'Buaya'],
      'correctAnswer': 1,
    },
    {
      'question': 'Unsur kimia dengan simbol \'O\' adalah?',
      'options': ['Emas', 'Oksigen', 'Perak', 'Osmium'],
      'correctAnswer': 1,
    },
    {
      'question': 'Negara terluas di dunia berdasarkan wilayah adalah?',
      'options': ['Kanada', 'Tiongkok', 'Amerika Serikat', 'Rusia'],
      'correctAnswer': 3,
    },
    {
      'question': 'Bahasa yang paling banyak digunakan di dunia adalah?',
      'options': ['Inggris', 'Mandarin', 'Spanyol', 'Arab'],
      'correctAnswer': 1,
    },
    {
      'question': 'Candi Borobudur terletak di provinsi?',
      'options': ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'DI Yogyakarta'],
      'correctAnswer': 1,
    },
    {
      'question': 'Mata uang resmi negara Inggris adalah?',
      'options': ['Euro', 'Dollar', 'Pound Sterling', 'Yen'],
      'correctAnswer': 2,
    },
  ];

  String _formatCurrentDate() {
    final now = DateTime.now();
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${now.day} ${months[now.month - 1]} ${now.year}';
  }

  void _finishQuiz() {
    int correctCount = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correctAnswer']) {
        correctCount++;
      }
    }

    int score = (correctCount / _questions.length * 100).round();

    final String savedName = context.read<NameProvider>().userName.isNotEmpty
        ? context.read<NameProvider>().userName
        : widget.userName;

    context.read<HistoryProvider>().addHistory(
      title: widget.title,
      userName: savedName,
      date: _formatCurrentDate(),
      score: score,
      maxScore: 100,
      correctCount: correctCount,
      totalQuestions: _questions.length,
      icon: widget.icon,
      iconColor: widget.iconColor,
      iconBackgroundColor: widget.iconBackgroundColor,
    );

    context.go(
      '/result',
      extra: {
        'userName': savedName,
        'score': score,
        'maxScore': 100,
        'correctCount': correctCount,
        'totalQuestions': _questions.length,
        'title': widget.title,
        'icon': widget.icon,
        'iconColor': widget.iconColor,
        'iconBackgroundColor': widget.iconBackgroundColor,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentIndex];
    final int answeredCount = _selectedAnswers.length;
    final int progressPercent = (answeredCount / _questions.length * 100)
        .round();

    final bool isAnswerSelectedForCurrent =
        _selectedAnswers[_currentIndex] != null;
    final bool hasPreviousQuestion = _currentIndex > 0;
    final bool isLastQuestion = _currentIndex == _questions.length - 1;
    final bool areAllQuestionsAnswered =
        _selectedAnswers.length == _questions.length;

    final bool isNextOrSubmitEnabled = isLastQuestion
        ? areAllQuestionsAnswered
        : isAnswerSelectedForCurrent;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      appBar: const TopBar(title: 'quizly'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Progress Text & Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        color: subtitleColor,
                      ),
                      children: [
                        const TextSpan(text: 'Pertanyaan '),
                        TextSpan(
                          text: '${_currentIndex + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        TextSpan(text: ' dari ${_questions.length}'),
                      ],
                    ),
                  ),
                  Text(
                    '$progressPercent% selesai',
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Progress Bar Line
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE5EF),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (_currentIndex + 1) / _questions.length,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Main Question Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle Label
                    const Text(
                      'PILIH SATU JAWABAN YANG BENAR',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Question Text
                    Text(
                      currentQuestion['question'],
                      style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Answer Options List
                    ...List.generate(
                      (currentQuestion['options'] as List).length,
                      (index) {
                        final String optionText =
                            currentQuestion['options'][index];
                        final String optionLetter = String.fromCharCode(
                          65 + index,
                        ); // A, B, C, D
                        final bool isSelected =
                            _selectedAnswers[_currentIndex] == index;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedAnswers[_currentIndex] = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFF6F0FC)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? primaryPurple
                                      : borderColor,
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Option Letter Badge (A, B, C, D)
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFFEFE6FA)
                                          : const Color(0xFFFAFAFC),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: isSelected
                                            ? primaryPurple
                                            : borderColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        optionLetter,
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? primaryPurple
                                              : subtitleColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Option Text
                                  Expanded(
                                    child: Text(
                                      optionText,
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 13,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.w500,
                                        color: textColor,
                                      ),
                                    ),
                                  ),

                                  // Radio Circle Selector
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? primaryPurple
                                            : borderColor,
                                        width: isSelected ? 6 : 1.5,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Navigation Buttons Row (Sebelumnya / Selanjutnya / Kirim)
              Row(
                children: [
                  // Previous Button
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: hasPreviousQuestion
                            ? () {
                                setState(() {
                                  _currentIndex--;
                                });
                              }
                            : null,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: hasPreviousQuestion
                                ? borderColor
                                : const Color(0xFFF2EEF6),
                          ),
                          backgroundColor: hasPreviousQuestion
                              ? Colors.white
                              : const Color(0xFFFAF9FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 16,
                              color: hasPreviousQuestion
                                  ? textColor
                                  : subtitleColor.withValues(alpha: 0.5),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Sebelumnya',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: hasPreviousQuestion
                                    ? textColor
                                    : subtitleColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Next / Submit Button
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: isNextOrSubmitEnabled
                            ? () {
                                if (isLastQuestion) {
                                  _finishQuiz();
                                } else {
                                  setState(() {
                                    _currentIndex++;
                                  });
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryPurple,
                          disabledBackgroundColor: palePurple,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isLastQuestion ? 'Kirim' : 'Selanjutnya',
                              style: const TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              isLastQuestion
                                  ? Icons.check
                                  : Icons.arrow_forward,
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

              // Helper message if user is on last question but hasn't answered all questions yet
              if (isLastQuestion && !areAllQuestionsAnswered) ...[
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Harap isi semua ${_questions.length} pertanyaan sebelum mengirim! (${_questions.length - _selectedAnswers.length} tersisa)',
                    style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD9534F),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              // Question Number Buttons (1 to 10 in EXACTLY ONE ROW)
              Row(
                children: List.generate(_questions.length, (index) {
                  final bool isCurrent = index == _currentIndex;
                  final bool isAnswered = _selectedAnswers[index] != null;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        height: 38,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? const Color(0xFFF3EBFA)
                              : (isAnswered
                                    ? const Color(0xFFF9F6FC)
                                    : Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isCurrent
                                ? primaryPurple
                                : (isAnswered
                                      ? const Color(0xFFC4A5EE)
                                      : borderColor),
                            width: isCurrent ? 1.5 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 11,
                              fontWeight: isCurrent || isAnswered
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isCurrent
                                  ? primaryPurple
                                  : (isAnswered
                                        ? const Color(0xFF5B358C)
                                        : subtitleColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
