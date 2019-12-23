import 'package:flutter/material.dart';
import './tip_sub_text.dart';
import 'package:intl/intl.dart';

import '../colors.dart';

class TipDisplay extends StatelessWidget {
  final double tipPercent;
  final double amount;
  final double tip;
  final double total;
  final NumberFormat currencyFormat;
  final NumberFormat percentageFormat;
  final double fontSize;

  TipDisplay({
    @required this.tipPercent,
    @required this.amount,
    @required this.tip,
    @required this.total,
    this.fontSize = 50.0,
  })  : this.currencyFormat =
            NumberFormat.currency(locale: 'en_US', symbol: '\$'),
        this.percentageFormat = NumberFormat.percentPattern('en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: TIP_DISPLAY_BACKGROUND_COLORS,
        ),
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.currencyFormat.format(total),
              style: TextStyle(
                color: Color(0xFFF9FDFE),
                fontFamily: 'Lato',
                fontSize: fontSize,
                letterSpacing: 5.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              width: 50.0,
              child: Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TipSubText(
              amount: currencyFormat.format(amount),
              label: 'Before Tip',
            ),
            TipSubText(
              amount: currencyFormat.format(tip),
              label: 'Tip Amount',
            ),
            TipSubText(
              amount: percentageFormat.format(tipPercent / 100.0),
              label: 'Tip Percent',
            ),
          ],
        ),
      ),
    );
  }
}
