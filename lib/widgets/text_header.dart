import 'package:flutter/material.dart';
import '../colors.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final double fontSize;

  TextHeader({@required this.text, this.fontSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        fontSize: fontSize,
        color: TEXT_HEADER_COLOR.withOpacity(0.6),
      ),
    );
  }
}
