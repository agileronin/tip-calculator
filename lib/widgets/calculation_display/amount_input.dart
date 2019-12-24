import 'package:flutter/material.dart';
import '../../constants.dart';

class AmountInput extends StatelessWidget {
  final Function amountChanged;
  final TextEditingController controller;
  final String labelText;
  final double fontSize;

  AmountInput({
    @required this.amountChanged,
    @required this.controller,
    this.labelText = '',
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        cursorColor: kAmountInputCursorColor,
        style: kAmountInputStyle.copyWith(
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: kAmountInputFillColor,
          labelText: labelText,
          labelStyle: kAmountLabelStyle,
        ),
        textAlign: TextAlign.right,
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
      ),
    );
  }
}
