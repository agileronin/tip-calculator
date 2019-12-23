import 'package:flutter/material.dart';

import '../colors.dart';

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
        color: selected
            ? PERCENT_BUTTON_BACKGROUND_COLOR_SELECTED
            : PERCENT_BUTTON_BACKGROUND_COLOR_UNSELECTED,
        border: Border.all(
          color: PERCENT_BUTTON_BORDER_COLOR,
        ),
      ),
      width: double.infinity,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor:
            PERCENT_BUTTON_BACKGROUND_COLOR_SELECTED.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: () => this.onPressed(),
        child: Text(
          this.buttonText,
          style: TextStyle(
              color: selected
                  ? PERCENT_BUTTON_TEXT_COLOR_SELECTED
                  : PERCENT_BUTTON_TEXT_COLOR_UNSELECTED,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato'),
        ),
      ),
    );
  }
}
