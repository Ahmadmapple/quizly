import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizly/Data/dummy_data.dart';

import '../Provider/HistoryProvider.dart';
import '../Provider/NameProvider.dart';
import '../Widgets/TopBar.dart';

class QuizScreen extends StatefulWidget {
  final String title;

  const QuizScreen({
    super.key,
    this.title = 'Seberapa luas wawasanmu?',
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

  QuizModel get _selectedQuiz {
    return dummyQuizzes.firstWhere(
      (q) => q.title.toLowerCase() == widget.title.toLowerCase(),
      orElse: () => dummyQuizzes.first,
    );
  }

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
    final quiz = _selectedQuiz;
    final questions = quiz.questions;
    int correctCount = 0;
    for (int i = 0; i < questions.length; i++) {
      if (_selectedAnswers[i] == questions[i]['correctAnswer']) {
        correctCount++;
      }
    }

    int score = (correctCount / questions.length * 100).round();

    final String savedName = context.read<NameProvider>().userName.isNotEmpty
        ? context.read<NameProvider>().userName
        : 'Pengguna';

    context.read<HistoryProvider>().addHistory(
          title: quiz.title,
          userName: savedName,
          date: _formatCurrentDate(),
          score: score,
          maxScore: 100,
          correctCount: correctCount,
          totalQuestions: questions.length,
          icon: quiz.icon,
          iconColor: quiz.iconColor,
          iconBackgroundColor: quiz.iconBackgroundColor,
        );

    context.go(
      '/result',
      extra: {
        'userName': savedName,
        'score': score,
        'maxScore': 100,
        'correctCount': correctCount,
        'totalQuestions': questions.length,
        'title': quiz.title,
        'icon': quiz.icon,
        'iconColor': quiz.iconColor,
        'iconBackgroundColor': quiz.iconBackgroundColor,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = _selectedQuiz;
    final questions = quiz.questions;
    final currentQuestion = questions[_currentIndex];
    final int answeredCount = _selectedAnswers.length;
    final int progressPercent =
        (answeredCount / questions.length * 100).round();

    final bool isAnswerSelectedForCurrent =
        _selectedAnswers[_currentIndex] != null;
    final bool hasPreviousQuestion = _currentIndex > 0;
    final bool isLastQuestion = _currentIndex == questions.length - 1;
    final bool areAllQuestionsAnswered =
        _selectedAnswers.length == questions.length;

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
                        TextSpan(text: ' dari ${questions.length}'),
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

              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE5EF),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (_currentIndex + 1) / questions.length,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

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

                    ...List.generate(
                      (currentQuestion['options'] as List).length,
                      (index) {
                        final String optionText =
                            currentQuestion['options'][index];
                        final String optionLetter = String.fromCharCode(
                          65 + index,
                        );
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

              Row(
                children: [
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

              if (isLastQuestion && !areAllQuestionsAnswered) ...[
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Harap isi semua ${questions.length} pertanyaan sebelum mengirim! (${questions.length - _selectedAnswers.length} tersisa)',
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

              Row(
                children: List.generate(questions.length, (index) {
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
