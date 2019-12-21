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
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                        child: TextHeader(
                          text: 'Tip Percentage',
                        ),
                      ),
                      PercentageButton(buttonText: '10%'),
                      PercentageButton(buttonText: '15%'),
                      PercentageButton(
                        buttonText: '20%',
                        selected: true,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                        child: TextHeader(text: 'Custom Amount',)
                      ),
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
