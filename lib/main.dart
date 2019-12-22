import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

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
  double _tipPercentage = 15.0;
  double _tip = 0.0;
  double _amount = 0.0;
  double _total = 0.0;
  MoneyMaskedTextController _amountInputController;

  @override
  void initState() {
    super.initState();
    this._amountInputController = MoneyMaskedTextController(
      leftSymbol: '\$',
      decimalSeparator: '.',
      precision: 2,
      thousandSeparator: ',',
      initialValue: 0.00,
    );
  }

  void _calculateTip() {
    _tip = (_amount * _tipPercentage) / 100.0;
    _total = _amount + _tip;
  }

  @override
  Widget build(BuildContext context) {
    _amountInputController.afterChange = (String _, double amountInput) {
      setState(() {
        _amount = amountInput;
        _calculateTip();
      });
    };

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
        theme: ThemeData.light().copyWith(
          brightness: Brightness.light,
        ),
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
                        controller: _amountInputController,
                        amountChanged: (value) {
                          setState(() {
                            _amount = value;
                            _calculateTip();
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
                            _calculateTip();
                          });
                        },
                      ),
                      PercentageButton(
                        buttonText: '15%',
                        selected: _tipPercentage == 15.0,
                        onPressed: () {
                          setState(() {
                            _tipPercentage = 15.0;
                            _calculateTip();
                          });
                        },
                      ),
                      PercentageButton(
                        buttonText: '20%',
                        selected: _tipPercentage == 20.0,
                        onPressed: () {
                          setState(() {
                            _tipPercentage = 20.0;
                            _calculateTip();
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
                        currentValue: _tipPercentage,
                        onSlide: (value) {
                          setState(() {
                            _tipPercentage = value;
                            _calculateTip();
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
