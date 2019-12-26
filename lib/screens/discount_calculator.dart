// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:tip_calculator/widgets/calculation_display/amount_input.dart';

// import '../widgets/widgets.dart';
// import '../utilities/widget_scaler.dart';

// class DiscountCalculator extends StatefulWidget {
//   @override
//   _DiscountCalculatorState createState() =>
//       _DiscountCalculatorState();
// }

// class _DiscountCalculatorState extends State<DiscountCalculator>
//     with SingleTickerProviderStateMixin {
//   double _tipPercentage = 0.0;
//   double _tip = 0.0;
//   double _amount = 0.0;
//   double _total = 0.0;
//   AnimationController controller;
//   Animation animation;

//   MoneyMaskedTextController _amountInputController;
//   WidgetScaler _widgetScaler;

//   @override
//   void initState() {
//     super.initState();
//     this._amountInputController = MoneyMaskedTextController(
//       leftSymbol: '\$',
//       decimalSeparator: '.',
//       precision: 2,
//       thousandSeparator: ',',
//       initialValue: 0.00,
//     );
//     controller =
//         AnimationController(duration: Duration(milliseconds: 500), vsync: this);
//     animation = CurvedAnimation(parent: controller, curve: Curves.decelerate)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((state) {
//         if (state == AnimationStatus.completed) {
//           controller.reset();
//           _resetForm();
//         }
//       });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void _calculateTip() {
//     _tip = (_amount * _tipPercentage) / 100.0;
//     _total = _amount + _tip;
//   }

//   OvalButton _buildPercentageButton(
//       String buttonText, double tipPercentage, double fontSize) {
//     return OvalButton(
//       buttonText: buttonText,
//       selected: _tipPercentage == tipPercentage,
//       fontSize: fontSize,
//       onPressed: () {
//         setState(() {
//           _tipPercentage = tipPercentage;
//           _calculateTip();
//         });
//       },
//     );
//   }

//   double _computeFontSize(double fontToScreenRatio) {
//     int resizeRatio =
//         int.parse((_total - _total % 10).round().toString()).toString().length -
//             1;
//     return (fontToScreenRatio - resizeRatio) - 2;
//   }

//   void _resetFormAnimation() {
//     setState(() {
//       controller.forward();
//     });
//   }

//   void _resetForm() {
//     _tipPercentage = 0.0;
//     _amount = 0.0;
//     _total = 0.0;
//     _tip = 0.0;
//     _amountInputController.updateValue(0.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     _amountInputController.afterChange = (String _, double amountInput) {
//       setState(() {
//         _amount = amountInput;
//         if (_amount > 0.0) {
//           _calculateTip();
//         } else {
//           _resetForm();
//         }
//       });
//     };

//     _widgetScaler = WidgetScaler(mediaQueryData: MediaQuery.of(context));

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               flex: 2,
//               child: CalculationDisplay(
//                 animation: animation,
//                 resetCalculator: _resetFormAnimation,
//                 tipPercent: _tipPercentage,
//                 amount: _amount,
//                 tip: _tip,
//                 total: _total,
//                 fontSize:
//                     _widgetScaler.safeBlockHorizontal * _computeFontSize(20.0),
//                 amountFontSize: _widgetScaler.safeBlockHorizontal * 3.5,
//                 labelFontSize: _widgetScaler.safeBlockHorizontal * 3.0,
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Column(
//                 children: <Widget>[
//                   AmountInput(
//                     labelText: 'Amount Before Discount',
//                     fontSize: _widgetScaler.safeBlockHorizontal * 4.0,
//                     controller: _amountInputController,
//                     amountChanged: (value) {
//                       setState(() {
//                         _amount = value;
//                         _calculateTip();
//                       });
//                     },
//                   ),
//                   AmountInput(
//                     labelText: 'Discount Percentage to Apply',
//                     fontSize: _widgetScaler.safeBlockHorizontal * 4.0,
//                     controller: _amountInputController,
//                     amountChanged: (value) {
//                       setState(() {
//                         _amount = value;
//                         _calculateTip();
//                       });
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
//                     child: TextHeader(
//                       text: 'Typical Discount Percentages',
//                       fontSize: _widgetScaler.safeBlockHorizontal * 3.0,
//                     ),
//                   ),
//                   _buildPercentageButton(
//                       '10%', 10.0, _widgetScaler.safeBlockHorizontal * 4.0),
//                   _buildPercentageButton(
//                       '25%', 15.0, _widgetScaler.safeBlockHorizontal * 4.0),
//                   _buildPercentageButton(
//                       '50%', 20.0, _widgetScaler.safeBlockHorizontal * 4.0),
//                   _buildPercentageButton(
//                       '70%', 25.0, _widgetScaler.safeBlockHorizontal * 4.0),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
//                     child: TextHeader(
//                       text: 'Custom Discount Percentage',
//                       fontSize: _widgetScaler.safeBlockHorizontal * 3.0,
//                     ),
//                   ),
//                   CustomSlider(
//                     currentValue: _tipPercentage,
//                     onSlide: (value) {
//                       setState(
//                         () {
//                           _tipPercentage = value;
//                           _calculateTip();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
