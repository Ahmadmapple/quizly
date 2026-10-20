import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Provider/NameProvider.dart';

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
    final savedName = context.read<NameProvider>().userName;
    if (savedName.isNotEmpty) {
      _nameController.text = savedName;
      _isInputValid = true;
    }
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF161320) : const Color(0xFFFAFAFC);
    final textColor =
        isDark ? const Color(0xFFF4F0FB) : const Color(0xFF29243A);
    final subtitleColor =
        isDark ? const Color(0xFFAFA5C2) : const Color(0xFF8A8199);
    final labelColor =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF9560C5);
    final primaryPurple =
        isDark ? const Color(0xFFC099EA) : const Color(0xFF9363C5);
    final palePurple =
        isDark ? const Color(0xFF3C3352) : const Color(0xFFD8CBEC);
    final inputBg =
        isDark ? const Color(0xFF231F33) : const Color(0xFFF9F7FC);

    final effectiveIconBg = isDark
        ? Color.alphaBlend(
            widget.iconColor.withValues(alpha: 0.25), const Color(0xFF2E2742))
        : widget.iconBackgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, color: textColor, size: 22),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: effectiveIconBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 30),
              ),
              const SizedBox(height: 20),

              Text(
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

              Text(
                'Siap menguji wawasan?',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                '${widget.questionCount} pertanyaan',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 12,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 28),

              Text(
                'Siapa nama kamu?',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  color: inputBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isInputValid
                        ? primaryPurple
                        : (isDark
                            ? const Color(0xFF483D63)
                            : const Color(0xFFC4A5EE)),
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    color: textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan namamu',
                    hintStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: subtitleColor,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Text(
                'Namamu akan ditampilkan pada hasil kuis.',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 10,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isInputValid
                      ? () {
                          final String enteredName =
                              _nameController.text.trim();
                          context
                              .read<NameProvider>()
                              .setUserName(enteredName);

                          context.go(
                            '/quiz',
                            extra: {
                              'userName': enteredName,
                              'title': widget.title,
                              'description': widget.description,
                              'icon': widget.icon,
                              'iconColor': widget.iconColor,
                              'iconBackgroundColor':
                                  widget.iconBackgroundColor,
                              'questionCount': widget.questionCount,
                            },
                          );
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ayo, mulai kuis',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _isInputValid
                              ? Colors.white
                              : (isDark
                                  ? const Color(0xFF8B81A6)
                                  : Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: _isInputValid
                            ? Colors.white
                            : (isDark
                                ? const Color(0xFF8B81A6)
                                : Colors.white),
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
