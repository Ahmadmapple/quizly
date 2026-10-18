import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Color(0xffffffff),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/Assets/Ikon Q Ungu Berlapis Modern.png',
            width: 54,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Manrope",
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
