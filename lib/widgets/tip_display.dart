import 'package:flutter/material.dart';

class TipDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            const Color(0xFF20D5A6),
            const Color(0xFF1DB9AB),
            const Color(0xFF19A3AE),
          ],
        ),
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\$1,000,000.00',
              style: TextStyle(
                color: Color(0xFFF9FDFE),
                fontFamily: 'Lato',
                fontSize: 50.0,
                letterSpacing: 5.0,
              ),
            ),
            SizedBox(height: 12.0,),
            Container(
              width: 50.0,
              child: Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
            ),
            SizedBox(height: 12.0,),
            TipSubText(
              amount: '\$1,000,000.00',
              label: 'Total',
            ),
            TipSubText(
              amount: '\$1.25',
              label: 'Tip (\$)',
            ),
            TipSubText(
              amount: '20%',
              label: 'Tip (%)',
            ),
          ],
        ),
      ),
    );
  }
}

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
              // padding: EdgeInsets.all(10.0),
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
