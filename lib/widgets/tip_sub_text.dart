import 'package:flutter/material.dart';

import '../colors.dart';

class TipSubText extends StatelessWidget {
  final String amount;
  final String label;

  TipSubText({@required this.amount, @required this.label});

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
                  fontSize: 18.0,
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
                    fontSize: 12.0,
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
