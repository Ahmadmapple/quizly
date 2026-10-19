import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NameScreen extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final int questionCount;

  const NameScreen({
    super.key,
    this.title = 'Seberapa luas wawasanmu?',
    this.description = 'Jelajahi fakta menarik dari berbagai penjuru dunia.',
    this.icon = Icons.language,
    this.iconColor = const Color(0xFF437B62),
    this.iconBackgroundColor = const Color(0xFFE4F0E8),
    this.questionCount = 10,
  });

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isInputValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
  }

  void _onNameChanged() {
    setState(() {
      _isInputValid = _nameController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged);
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF29243A);
    const subtitleColor = Color(0xFF8A8199);
    const labelColor = Color(0xFF9560C5);
    const primaryPurple = Color(0xFF9363C5);
    const palePurple = Color(0xFFD8CBEC);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Left Back Button (<-)
              InkWell(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: textColor,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Dynamic Icon Container from clicked QuizListCard
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),

              // Tagline
              const Text(
                'PETUALANGAN BARU MENANTI',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: labelColor,
                ),
              ),
              const SizedBox(height: 6),

              // Main Heading / Title
              const Text(
                'Siap menguji wawasan?',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),

              // Selected Quiz Subtitle / Title
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 4),

              // Question Count
              Text(
                '${widget.questionCount} pertanyaan',
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 12,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 28),

              // Field Label
              const Text(
                'Siapa nama kamu?',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),

              // TextField for Name Input
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F7FC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isInputValid
                        ? primaryPurple
                        : const Color(0xFFC4A5EE),
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    color: textColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Masukkan namamu',
                    hintStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: Color(0xFFA099AE),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Help text under textfield
              const Text(
                'Namamu akan ditampilkan pada hasil kuis.',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 10,
                  color: subtitleColor,
                ),
              ),

              const Spacer(),

              // Start Quiz Button ("Ayo, mulai kuis ->")
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isInputValid
                      ? () {
                          context.go('/quiz', extra: {
                            'userName': _nameController.text.trim(),
                            'title': widget.title,
                            'description': widget.description,
                            'icon': widget.icon,
                            'iconColor': widget.iconColor,
                            'iconBackgroundColor': widget.iconBackgroundColor,
                            'questionCount': widget.questionCount,
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    disabledBackgroundColor: palePurple,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ayo, mulai kuis',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
