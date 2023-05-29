import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabbarButton extends ConsumerStatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  const HomeTabbarButton({super.key, required this.onTap, required this.title, required this.isSelected});

  @override
  ConsumerState<HomeTabbarButton> createState() => _HomeTabbarButtonState();
}

class _HomeTabbarButtonState extends ConsumerState<HomeTabbarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: widget.isSelected ? Colors.red : Colors.transparent, width: 6),
        )),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isSelected ? Colors.red : Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
