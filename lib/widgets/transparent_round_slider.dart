import 'package:flutter/material.dart';

class TransparentRoundSliderThumbShape extends SliderComponentShape {
  const TransparentRoundSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
  });

  final double enabledThumbRadius;
  final double disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Color(0xFF25D9A5)
        ..strokeWidth = 1.0,
    );
  }
}
