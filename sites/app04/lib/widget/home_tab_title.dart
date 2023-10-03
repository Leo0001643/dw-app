import 'dart:math';
import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';

class HomeTabTitleWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<Color> colors;
  /// 左下角角度
  final double angles;

  final String title;
  final TextStyle style;
  HomeTabTitleWidget({required this.width, required this.height, required this.colors, required this.angles, required this.title, required this.style});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [

        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: CustomPaint(
              painter: _TitlePainter(colors: colors, angles: angles),
            )),
        Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(title, style: style,),
        ),
      ],
    );
  }

}

class _TitlePainter extends CustomPainter {
  final List<Color> colors;
  /// 左下角角度
  final double angles;
  _TitlePainter({required this.colors, required this.angles}) {
    _paint = Paint();

  }

  late Paint _paint;
  Path _path = Path();
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _paint.shader = UI.Gradient.linear(
        UI.Offset(0, 0), UI.Offset(size.width,0), colors,[0,1], TileMode.clamp, null
    );
    if (angles < 90) {
      double distance = size.height / tan(angles);
      _drawAcuteAngleParallelogram(canvas, size, distance);
    } else {
      double distance = size.height / tan(180 - angles);
      _drawObtuseAngleParallelogram(canvas, size, distance);
    }

  }
  void _drawAcuteAngleParallelogram(Canvas canvas, Size size, double distance){
    _path.moveTo(0, size.height);
    _path.lineTo(size.width - distance, size.height);
    _path.lineTo(size.width, 0);
    _path.lineTo(distance,0);
    _path.close();
    canvas.drawPath(_path, _paint);
  }
  void _drawObtuseAngleParallelogram(Canvas canvas, Size size, double distance){
    _path.moveTo(distance, size.height);
    _path.lineTo(size.width, size.height);
    _path.lineTo(size.width - distance, 0);
    _path.lineTo(0,0);
    _path.close();
    canvas.drawPath(_path, _paint);
  }
  @override
  bool shouldRepaint(_TitlePainter oldDelegate) {
    // TODO: implement shouldRepaint
    return (oldDelegate.colors != colors || oldDelegate.angles != angles);
  }

}