import 'package:aone_common/controllers/task_center/task_center_logic.dart';
import 'package:flutter/material.dart';

/// 领带型标签
/// 使用方式：需要是放在[CustomPaint.foregroundPainter]
/// 或则[CustomPaint.painter]才能生效
class LabelPainter extends CustomPainter {

  LabelColor labelColor;
  LabelPainter(this.labelColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: labelColor.colors,
      ).createShader(Offset.zero & size)
      ..strokeWidth = 1;

    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(0, size.height * 0.85)
        ..lineTo(size.width / 2, size.height)
        ..lineTo(size.width, size.height * 0.85)
        ..lineTo(size.width, 0)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



extension LabelColorExt on LabelColor {

  static LabelColor fromStatus(int status) {
    switch (status) {
      case 1:
        return LabelColor.blue;
      default:
        return LabelColor.gray;
    }
  }

  List<Color> get colors {
    switch (this) {
      case LabelColor.gray:
      return [
        const Color.fromRGBO(170, 170, 170, 1),
        const Color.fromRGBO(128, 128, 128, 1),
      ];
      case LabelColor.blue:
        return [
          const Color.fromRGBO(0, 137, 255, 1),
          const Color.fromRGBO(0, 94, 244, 1),
        ];
      case LabelColor.purple:
        return [
          const Color.fromRGBO(151, 43, 255, 1),
          const Color.fromRGBO(129, 0, 246, 1),
        ];
      case LabelColor.red:
        return [
          const Color.fromRGBO(255, 75, 82, 1),
          const Color.fromRGBO(255, 0, 0, 1),
        ];
    }
  }
}


