import 'package:flutter/material.dart';

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
        color: Color(0xFF939BA0),
      ),
    );
  }
}
