
import 'package:flutter/material.dart';

class AnswerLine extends StatelessWidget {
  const AnswerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFFB),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xFFE3D7F4),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 4,
            color: Color(0xFFB69AD9),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFD3C1EC),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
