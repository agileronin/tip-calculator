import 'package:flutter/material.dart';

const TEXT_COLOR_SELECTED = Colors.white;
const BACKGROUND_COLOR_SELECTED = Color(0xFF25D9A5);

const TEXT_COLOR_UNSELECTED = Color(0xFF25D9A5);
const BACKGROUND_COLOR_UNSELECTED = Colors.transparent;

class PercentageButton extends StatelessWidget {
  final String buttonText;
  final bool selected;
  final Function onPressed;

  PercentageButton(
      {@required this.buttonText,
      @required this.onPressed,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:
            selected ? BACKGROUND_COLOR_SELECTED : BACKGROUND_COLOR_UNSELECTED,
        border: Border.all(
          color: Color(0xFF25D9A5),
        ),
      ),
      width: double.infinity,
      child: FlatButton(
        splashColor: Colors.transparent,
        onPressed: () => this.onPressed(),
        child: Text(
          this.buttonText,
          style: TextStyle(
              color: selected ? TEXT_COLOR_SELECTED : TEXT_COLOR_UNSELECTED,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato'),
        ),
      ),
    );
  }
}
