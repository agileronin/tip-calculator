import 'package:flutter/material.dart';

import '../colors.dart';
import './transparent_round_slider.dart';

class CustomTipSlider extends StatefulWidget {
  final Function onSlide;
  final double currentValue;

  CustomTipSlider({@required this.onSlide, @required this.currentValue});

  @override
  _CustomTipSliderState createState() => _CustomTipSliderState();
}

class _CustomTipSliderState extends State<CustomTipSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: SLIDER_ACTIVE_TRACK_COLOR,
              inactiveTrackColor: SLIDER_INACTIVE_TRACK_COLOR,
              thumbShape: TransparentRoundSliderThumbShape(
                enabledThumbRadius: 25.0,
                disabledThumbRadius: 25.0,
              ),
              thumbColor: SLIDER_THUMB_COLOR.withOpacity(0.25),
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
