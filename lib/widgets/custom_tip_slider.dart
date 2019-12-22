import 'package:flutter/material.dart';
import './transparent_round_slider.dart';

class CustomTipSlider extends StatefulWidget {
  final Function onSlide;

  CustomTipSlider({@required this.onSlide});

  @override
  _CustomTipSliderState createState() => _CustomTipSliderState();
}

class _CustomTipSliderState extends State<CustomTipSlider> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color(0xFF1BB3A8),
              inactiveTrackColor: Color(0xFFEAF1F7),
              thumbShape: TransparentRoundSliderThumbShape(
                enabledThumbRadius: 25.0,
                disabledThumbRadius: 25.0,
              ),
              thumbColor: Colors.green.withOpacity(0.25),
              trackHeight: 10.0,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Expanded(
              child: Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  label: _value.toString(),
                  onChanged: (percentage) {
                    setState(() {
                      widget.onSlide(double.parse(percentage.toStringAsFixed(2)));
                      _value = double.parse(percentage.toStringAsFixed(2));
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
