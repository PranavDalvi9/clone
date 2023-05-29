import 'package:flutter/material.dart';

class CapsuleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String total;
  final bool isSelected;
  const CapsuleButton({super.key, required this.title, required this.total, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? Colors.red : const Color.fromARGB(255, 193, 193, 193)),
        ),
        child: Text(
          '$title ($total)',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.red : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
