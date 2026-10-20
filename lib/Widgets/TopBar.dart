import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ThemeProvider.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/Assets/Ikon Q Ungu Berlapis Modern.png',
            width: 44,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Manrope",
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: isDark ? const Color(0xFF211D30) : Colors.white,
      elevation: 0,
      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            final isDarkMode = themeProvider.isDarkMode;
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: InkWell(
                  onTap: () {
                    themeProvider.toggleTheme();
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF2E2942)
                          : const Color(0xFFEEE5F8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDarkMode
                            ? const Color(0xFF4A4068)
                            : const Color(0xFFDCCAF4),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isDarkMode
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          color: isDarkMode
                              ? const Color(0xFFFFD54F)
                              : const Color(0xFF7A4DB3),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isDarkMode ? 'Gelap' : 'Terang',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFE2D8F6)
                                : const Color(0xFF5B358C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
