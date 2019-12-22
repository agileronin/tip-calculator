import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import './widgets/widgets.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(TipCalculator());
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _tipPercentage = 0.0;
  double _tip = 0.0;
  double _amount = 0.0;
  double _total = 0.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                  child: TipDisplay(
                    tipPercent: _tipPercentage,
                    amount: _amount,
                    tip: _tip,
                    total: _total,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TipAmountInput(
                        amountChanged: (value) {
                          setState(() {
                            _amount = double.parse(value);
                            _tip = (_amount * _tipPercentage) / 100.0;
                            _total = _amount + _tip;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                        child: TextHeader(
                          text: 'Tip Percentage',
                        ),
                      ),
                      PercentageButton(
                        buttonText: '10%',
                        selected: _tipPercentage == 10.0,
                        onPressed: () {
                          setState(() {
                            _tipPercentage = 10.0;
                            _tip = (_amount * _tipPercentage) / 100.0;
                            _total = _amount + _tip;
                          });
                        },
                      ),
                      PercentageButton(
                        buttonText: '15%',
                        selected: _tipPercentage == 15.0,
                        onPressed: () {
                          setState(() {
                            _tipPercentage = 15.0;
                            _tip = (_amount * _tipPercentage) / 100.0;
                            _total = _amount + _tip;
                          });
                        },
                      ),
                      PercentageButton(
                        buttonText: '20%',
                        selected: _tipPercentage == 20.0,
                        onPressed: () {
                          setState(() {
                            _tipPercentage = 20.0;
                            _tip = (_amount * _tipPercentage) / 100.0;
                            _total = _amount + _tip;
                          });
                        },
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                          child: TextHeader(
                            text: 'Custom Amount',
                          )),
                      CustomTipSlider(
                        onSlide: (value) {
                          setState(() {
                            _tipPercentage = value;
                            _tip = (_amount * _tipPercentage) / 100.0;
                            _total = _amount + _tip;
                          });
                        },
                      ),
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
