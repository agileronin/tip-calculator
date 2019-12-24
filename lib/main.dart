import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculator/screens/test_screen_1.dart';
import 'package:tip_calculator/screens/test_screen_2.dart';

import './screens/tip_calculator_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(TipCalculator());
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
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
        initialRoute: '/',
        routes: {
          '/': (context) => TipCalculatorScreen(),
          '/test1': (context) => TestScreenOne(),
          '/test2': (context) => TestScreenTwo()
        },
      ),
    );
  }
}
