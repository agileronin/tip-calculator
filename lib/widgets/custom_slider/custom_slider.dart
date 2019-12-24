import 'package:flutter/material.dart';

import '../../constants.dart';
import './transparent_round_slider.dart';

class CustomSlider extends StatefulWidget {
  final Function onSlide;
  final double currentValue;

  CustomSlider({
    @required this.onSlide,
    @required this.currentValue,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kSliderActiveTrackColor,
              inactiveTrackColor: kSliderInactiveTrackColor,
              thumbShape: TransparentRoundSliderThumbShape(
                enabledThumbRadius: 25.0,
                disabledThumbRadius: 25.0,
              ),
              thumbColor: kSliderThumbColor.withOpacity(0.25),
              trackHeight: 10.0,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Expanded(
              child: Slider(
                min: 0.0,
                max: 100.0,
                divisions: 100,
                value: widget.currentValue,
                onChanged: (percentage) {
                  setState(() {
                    widget.onSlide(double.parse(
                      percentage.toStringAsFixed(0),
                    ));
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
