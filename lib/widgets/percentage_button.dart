import 'package:flutter/material.dart';

class PercentageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.green,
        ),
      ),
      width: double.infinity,
      child: FlatButton(
        onPressed: () {},
        child: Text('10%'),
      ),
    );
  }
}
