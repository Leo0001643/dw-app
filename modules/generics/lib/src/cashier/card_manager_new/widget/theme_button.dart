library push_button;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';

// 主题按钮
class ThemeButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Widget? child;
  final bool enabled;
  final Gradient color;
  final Gradient wrapper;
  final double height;
  final double width;
  final int duration;
  final BoxShape shape;
  final double radius;
  final String? btnText;
  final Color? textColor;

  const ThemeButton({
    Key? key,
    required this.onPressed,
    this.textColor,
    this.child,
    this.btnText,
    this.enabled = true,
    this.color = const LinearGradient(
      colors: [
        Color.fromRGBO(247, 229, 181, 1),
        Color.fromRGBO(181, 149, 105, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.715],
    ),
    this.wrapper = const LinearGradient(
      colors: [
        Color.fromRGBO(164, 124, 72, 1),
        Color.fromRGBO(229, 172, 75, 1),
        Color.fromRGBO(143, 98, 44, 1),
        Color.fromRGBO(227, 171, 74, 1),
        Color.fromRGBO(140, 93, 37, 1),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.034, 0.175, 0.341, 0.53, 0.783],
    ),
    this.height = 30,
    this.width = 100,
    this.duration = 70,
    this.shape = BoxShape.rectangle,
    this.radius = 6,
  }) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  Curve curve = Curves.easeIn;
  double shadowHeight = 2;
  double position = 2.0;

  void pressed(_) {
    setState(() {
      position = 0.0;
    });
  }

  void unPressed({required void Function() onPressed}) {
    setState(() {
      position = 2.0;
    });
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - shadowHeight;

    return GestureDetector(
      child: SizedBox(
        width: widget.width.r,
        height: _height.r + shadowHeight.r,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: _height.r,
                width: widget.width.r,
                decoration: BoxDecoration(
                  //gradient
                  gradient: widget.wrapper,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.radius),
                  ),
                  shape: widget.shape,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: position,
              child: Container(
                height: _height.r,
                width: widget.width.r,
                decoration: BoxDecoration(
                  gradient: widget.color,
                  borderRadius: widget.shape != BoxShape.circle
                      ? BorderRadius.all(
                          Radius.circular(widget.radius),
                        )
                      : null,
                  shape: widget.shape,
                ),
                child: Center(
                  child: widget.child ??
                      Text(
                        widget.btnText ?? 'text',
                        style: TextStyle(
                          color: widget.textColor ?? const Color.fromRGBO(59, 42, 22, 1),
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTapDown: widget.enabled ? pressed : null,
      onTapUp:
          widget.enabled ? (_) => unPressed(onPressed: widget.onPressed) : null,
      onTapCancel:
          widget.enabled ? () => unPressed(onPressed: widget.onPressed) : null,
    );
  }
}
