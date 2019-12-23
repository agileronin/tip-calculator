import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/widgets.dart';
import '../widget_scaler.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  double _tipPercentage = 20.0;
  double _tip = 0.0;
  double _amount = 0.0;
  double _total = 0.0;
  MoneyMaskedTextController _amountInputController;
  WidgetScaler _widgetScaler;

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

  PercentageButton _buildPercentageButton(
      String buttonText, double tipPercentage, double fontSize) {
    return PercentageButton(
      buttonText: buttonText,
      selected: _tipPercentage == tipPercentage,
      fontSize: fontSize,
      onPressed: () {
        setState(() {
          _tipPercentage = tipPercentage;
          _calculateTip();
        });
      },
    );
  }

  double _computeFontSize(double fontToScreenRatio) {
    int resizeRatio =
        int.parse((_total - _total % 10).round().toString()).toString().length -
            1;
    return (fontToScreenRatio - resizeRatio) - 2;
  }

  @override
  Widget build(BuildContext context) {
    _amountInputController.afterChange = (String _, double amountInput) {
      setState(() {
        _amount = amountInput;
        _calculateTip();
      });
    };

    _widgetScaler = WidgetScaler(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
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
                fontSize:
                    _widgetScaler.safeBlockHorizontal * _computeFontSize(20.0),
                amountFontSize: _widgetScaler.safeBlockHorizontal * 3.5,
                labelFontSize: _widgetScaler.safeBlockHorizontal * 3.0,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  TipAmountInput(
                    fontSize: _widgetScaler.safeBlockHorizontal * 4.0,
                    controller: _amountInputController,
                    amountChanged: (value) {
                      setState(() {
                        _amount = value;
                        _calculateTip();
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                    child: TextHeader(
                      text: 'Standard Tip Percentages',
                      fontSize: _widgetScaler.safeBlockHorizontal * 3.0,
                    ),
                  ),
                  _buildPercentageButton(
                    '10%',
                    10.0,
                    _widgetScaler.safeBlockHorizontal * 4.0,
                  ),
                  _buildPercentageButton(
                      '15%', 15.0, _widgetScaler.safeBlockHorizontal * 4.0),
                  _buildPercentageButton(
                      '20%', 20.0, _widgetScaler.safeBlockHorizontal * 4.0),
                  _buildPercentageButton(
                      '25%', 25.0, _widgetScaler.safeBlockHorizontal * 4.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                    child: TextHeader(
                      text: 'Custom Tip Percentage',
                      fontSize: _widgetScaler.safeBlockHorizontal * 3.0,
                    ),
                  ),
                  CustomTipSlider(
                    currentValue: _tipPercentage,
                    onSlide: (value) {
                      setState(
                        () {
                          _tipPercentage = value;
                          _calculateTip();
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
