import 'package:flutter/material.dart';

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
                  color: Colors.white,
                ),
                // ),
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
                    color: Colors.white.withOpacity(0.6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
