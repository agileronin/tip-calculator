import 'package:flutter/material.dart';

import '../../constants.dart';

class TextSubHeader extends StatelessWidget {
  final String amount;
  final String label;
  final double amountFontSize;
  final double labelFontSize;

  TextSubHeader({
    @required this.amount,
    @required this.label,
    this.amountFontSize = 18.0,
    this.labelFontSize = 12.0,
  });

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
                style: kTextSubHeaderStyle.copyWith(
                  fontSize: amountFontSize,
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
                style: kTextSubHeaderLabelStyle.copyWith(
                  fontSize: labelFontSize,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
