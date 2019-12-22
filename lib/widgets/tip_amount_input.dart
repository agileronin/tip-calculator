import 'package:flutter/material.dart';

class TipAmountInput extends StatelessWidget {
  final Function amountChanged;

  TipAmountInput({@required this.amountChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TextFormField(
        cursorColor: Color(0xFF939BA0),
        onChanged: (data) {
          amountChanged(data);
        },
        style: TextStyle(
          // fontSize: 20.0,
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
