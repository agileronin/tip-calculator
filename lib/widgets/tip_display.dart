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
              '\$0.00',
              style: TextStyle(
                color: Color(0xFFF9FDFE),
                fontFamily: 'Lato',
                fontSize: 100.0,
                letterSpacing: 5.0,
              ),
            ),
            Container(
              width: 50.0,
              child: Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$0.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'TOTAL',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '20%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'TIP',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
