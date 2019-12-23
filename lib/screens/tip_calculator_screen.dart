import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/widgets.dart';

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

  PercentageButton _buildPercentageButton(String buttonText, tipPercentage) {
    return PercentageButton(
      buttonText: buttonText,
      selected: _tipPercentage == tipPercentage,
      onPressed: () {
        setState(() {
          _tipPercentage = tipPercentage;
          _calculateTip();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _amountInputController.afterChange = (String _, double amountInput) {
      setState(() {
        _amount = amountInput;
        _calculateTip();
      });
    };

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
                fontSize: 25.0,
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
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                    child: TextHeader(
                      text: 'Standard Tip Percentages',
                    ),
                  ),
                  _buildPercentageButton('10%', 10.0),
                  _buildPercentageButton('15%', 15.0),
                  _buildPercentageButton('20%', 20.0),
                  _buildPercentageButton('25%', 25.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                    child: TextHeader(
                      text: 'Custom Tip Percentage',
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
