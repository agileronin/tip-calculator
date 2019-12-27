import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class CalculationDisplay extends StatelessWidget {
  final double tipPercent;
  final double amount;
  final double tip;
  final double total;
  final NumberFormat currencyFormat;
  final NumberFormat percentageFormat;
  // final double fontSize;
  final double amountFontSize;
  final double labelFontSize;
  final Function resetCalculator;
  final Animation animation;
  final List<Widget> children;

  CalculationDisplay({
    @required this.tipPercent,
    @required this.amount,
    @required this.tip,
    @required this.total,
    @required this.resetCalculator,
    @required this.children,
    this.animation,
    // this.fontSize = 50.0,
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
          children: [
            ...children,
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: RawMaterialButton(
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 2.0,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
