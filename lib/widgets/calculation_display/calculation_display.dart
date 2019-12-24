import 'package:flutter/material.dart';
import './text_sub_header.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class CalculationDisplay extends StatelessWidget {
  final double tipPercent;
  final double amount;
  final double tip;
  final double total;
  final NumberFormat currencyFormat;
  final NumberFormat percentageFormat;
  final double fontSize;
  final double amountFontSize;
  final double labelFontSize;
  final Function resetCalculator;
  final Animation animation;

  CalculationDisplay({
    @required this.tipPercent,
    @required this.amount,
    @required this.tip,
    @required this.total,
    @required this.resetCalculator,
    this.animation,
    this.fontSize = 50.0,
    this.amountFontSize = 18.0,
    this.labelFontSize = 12.0,
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
          colors: kTipDisplayBackgroundColors,
        ),
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                this.currencyFormat.format(total),
                style: TextStyle(
                  color: Color(0xFFF9FDFE),
                  fontFamily: 'Lato',
                  fontSize: fontSize,
                  letterSpacing: 5.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                12.0,
              ),
              child: RotationTransition(
                turns: animation,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: kPercentButtonBackgroundColorSelected,
                  elevation: 0.0,
                  onPressed: resetCalculator,
                  child: Icon(
                    Icons.refresh,
                    color: kPercentButtonTextColorSelected,
                  ),
                ),
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
            TextSubHeader(
              amount: currencyFormat.format(amount),
              label: 'Before Tip',
              amountFontSize: amountFontSize,
              labelFontSize: labelFontSize,
            ),
            TextSubHeader(
              amount: currencyFormat.format(tip),
              label: 'Tip Amount',
              amountFontSize: amountFontSize,
              labelFontSize: labelFontSize,
            ),
            TextSubHeader(
              amount: percentageFormat.format(tipPercent / 100.0),
              label: 'Tip Percent',
              amountFontSize: amountFontSize,
              labelFontSize: labelFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
