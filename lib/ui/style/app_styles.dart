import 'package:flutter/material.dart';

class AppStyles {
  static defaultCardDecoration({required BuildContext context, Color? color, double radius = 10, Border? border}) {
    return BoxDecoration(
      color: color ?? Theme.of(context).colorScheme.onSecondary,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      boxShadow: [
        BoxShadow(
          offset: const Offset(3, 4),
          blurRadius: 16,
          color: Colors.black.withOpacity(0.03),
        ),
      ],
    );
  }
}
