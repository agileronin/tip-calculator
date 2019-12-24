import 'package:flutter/material.dart';

import '../../constants.dart';

class OvalButton extends StatelessWidget {
  final String buttonText;
  final bool selected;
  final Function onPressed;
  final double fontSize;

  OvalButton({
    @required this.buttonText,
    @required this.onPressed,
    this.selected = false,
    this.fontSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: selected
            ? kPercentButtonBackgroundColorSelected
            : kPercentButtonBackgroundColorUnselected,
        border: Border.all(
          color: kPercentButtonBorderColor,
        ),
      ),
      width: double.infinity,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: kPercentButtonBackgroundColorSelected.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: () => this.onPressed(),
        child: Text(
          this.buttonText,
          style: kOvalButtonTextStyle.copyWith(
            fontSize: fontSize,
            color: selected
                ? kPercentButtonTextColorSelected
                : kPercentButtonTextColorUnselected,
          ),
        ),
      ),
    );
  }
}
