import 'package:flutter/material.dart';
import '../colors.dart';

class TipAmountInput extends StatelessWidget {
  final Function amountChanged;
  final TextEditingController controller;
  final double fontSize;

  TipAmountInput(
      {@required this.amountChanged,
      @required this.controller,
      this.fontSize = 12.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        cursorColor: TIP_INPUT_CURSOR_COLOR,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: TIP_INPUT_COLOR,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: TIP_INPUT_FILL_COLOR,
          labelText: 'Amount Before Tip',
          labelStyle: TextStyle(
            color: TIP_INPUT_LABEL_COLOR,
          ),
        ),
        textAlign: TextAlign.right,
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
      ),
    );
  }
}
