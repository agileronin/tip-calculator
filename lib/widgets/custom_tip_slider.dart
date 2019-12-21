import 'package:flutter/material.dart';
import './transparent_round_slider.dart';

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
              child: SliderTheme(
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
                child: Slider(
                  min: 0.0,
                  max: 100.0,
                  value: 25.0,
                  divisions: 100,
                  onChanged: (e) {},
                ),
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
