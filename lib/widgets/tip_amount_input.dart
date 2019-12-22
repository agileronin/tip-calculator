import 'package:flutter/material.dart';

class TipAmountInput extends StatelessWidget {
  final Function amountChanged;
  final TextEditingController controller;

  TipAmountInput({@required this.amountChanged, @required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        cursorColor: Color(0xFF939BA0),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF939BA0),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFECF4FA),
          labelText: 'Total',
          labelStyle: TextStyle(
            color: Color(0xFF939BA0),
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
