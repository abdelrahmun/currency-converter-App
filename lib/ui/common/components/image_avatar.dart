import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  ImageAvatar({
    required this.text,
    required this.index,
    Key? key,
  }) : super(key: key);

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: contactsBgColors[index % contactsBgColors.length],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          height: 1.4,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  List<Color> contactsBgColors = [
    const Color(0xFFA7C6FF),
    const Color(0xFFC0A6FF),
    const Color(0xFFA8EDFF),
  ];
}
