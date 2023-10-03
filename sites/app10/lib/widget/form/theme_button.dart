library push_button;

import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final double? fontSize;

  const ThemeButton({
    Key? key,
    required this.onPressed,
    this.textColor,
    this.child,
    this.btnText,
    this.enabled = true,
    this.color = AppTheme.primaryGradientBtnBg,
    this.wrapper = AppTheme.primaryBtnWarp,
    this.height = 44,
    this.width = 120,
    this.duration = 70,
    this.shape = BoxShape.rectangle,
    this.radius = 8,
    this.fontSize=16,
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
                          color: widget.textColor ?? AppTheme.blackTextColor,
                            fontSize: widget.fontSize,fontWeight: FontWeight.w600
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
