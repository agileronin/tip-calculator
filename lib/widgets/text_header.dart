import 'package:flutter/material.dart';
import '../colors.dart';

class TextHeader extends StatelessWidget {
  final String text;

  TextHeader({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: TEXT_HEADER_COLOR.withOpacity(0.6),
      ),
    );
  }
}
