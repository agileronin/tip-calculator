import 'package:flutter/material.dart';

import '../colors.dart';

class TipSubText extends StatelessWidget {
  final String amount;
  final String label;
  final double amountFontSize;
  final double labelFontSize;

  TipSubText(
      {@required this.amount,
      @required this.label,
      this.amountFontSize = 18.0,
      this.labelFontSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: amountFontSize,
                  fontFamily: 'Lato',
                  letterSpacing: 3.0,
                  color: TIP_SUB_TEXT_COLOR,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                    fontSize: labelFontSize,
                    fontFamily: 'Lato',
                    color: TIP_SUB_TEXT_COLOR.withOpacity(0.6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
