import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './widgets/widgets.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(TipCalculator());
}

class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData.light().copyWith(),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: TipDisplay(),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TipAmountInput(),
                      Text('TIP PERCENTAGE'),
                      PercentageButton(),
                      PercentageButton(),
                      PercentageButton(),
                      Text('CUSTOM AMOUNT'),
                      CustomTipSlider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
