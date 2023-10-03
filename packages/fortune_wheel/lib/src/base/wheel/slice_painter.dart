part of 'wheel.dart';

/// Draws a slice of a circle. The slice's arc starts at the right (3 o'clock)
/// and moves clockwise as far as specified by angle.
class _CircleSlicePainter extends CustomPainter {
  final Color fillColor;
  final Color? strokeColor;
  final double strokeWidth;
  final double angle;
  final List<Color>? gradientColors;
  final List<double>? stops;

  const _CircleSlicePainter({
    required this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.angle = _math.pi / 2,
    this.gradientColors,
    this.stops,
  }) : assert(angle > 0 && angle < 2 * _math.pi);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = _math.min(size.width, size.height);
    final path = _CircleSlice.buildSlicePath(radius, angle);

    // todo: support gradient
    // fill slice area
    canvas.drawPath(
      path,
      Paint()
        ..color = fillColor
        ..shader = gradientColors != null
            ? RadialGradient(
                center: const Alignment(
                  -1.35,
                  -0.4,
                ),
                colors: gradientColors!,
                stops: stops ??
                    const [
                      0.50,
                      1.0,
                    ],
              ).createShader(
                Rect.fromCircle(
                  radius: size.height,
                  center: Offset(
                    size.width * 1.4,
                    size.height / 2.7,
                  ),
                ),
              )
            : null
        ..style = PaintingStyle.fill,
    );

    // draw slice border
    if (strokeWidth > 0) {
      canvas.drawPath(
        path,
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );

      canvas.drawPath(
        Path()
          ..arcTo(
            Rect.fromCircle(
              center: const Offset(0, 0),
              radius: radius,
            ),
            0,
            angle,
            false,
          ),
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth * 2
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(_CircleSlicePainter oldDelegate) {
    return angle != oldDelegate.angle ||
        fillColor != oldDelegate.fillColor ||
        strokeColor != oldDelegate.strokeColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
