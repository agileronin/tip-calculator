import 'package:flutter/material.dart';

class CustomTipSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Slider(
                activeColor: Colors.green,
                inactiveColor: Colors.green,
                min: 0.0,
                max: 100.0,
                value: 0.0,
                divisions: 100,
                label: '100%',
                onChanged: (e) {},
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '100%',
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
