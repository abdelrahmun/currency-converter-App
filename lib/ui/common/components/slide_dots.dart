import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  final Color? activeColor;
  final Color? notActiveColor;

  const SlideDots(
    this.isActive, {
    this.activeColor,
    this.notActiveColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor ?? Theme.of(context).primaryColor : notActiveColor ?? AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
