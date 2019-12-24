import 'package:flutter/material.dart';
import '../../constants.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final double fontSize;

  TextHeader({@required this.text, this.fontSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: kTextHeaderStyle.copyWith(fontSize: fontSize),
    );
  }
}
