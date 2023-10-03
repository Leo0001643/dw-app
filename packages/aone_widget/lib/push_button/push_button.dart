library push_button;

import 'package:flutter/material.dart';

/// 点击后会带下沉动画的按钮
/// 问题：由于采用[Stack]堆叠两个图层导致无法自适应内容宽度
/// 遇到需要做国际化的情况可以考虑在先用FittedBox包裹字体
class PushButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Widget child;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final ShadowDegree shadowDegree;
  final int duration;
  final BoxShape shape;
  final double radius;

  const PushButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.enabled = true,
    this.color = Colors.blue,
    this.height = 64,
    this.shadowDegree = ShadowDegree.light,
    this.width = 200,
    this.duration = 70,
    this.shape = BoxShape.rectangle,
    this.radius = 5,
  }) : super(key: key);

  @override
  State<PushButton> createState() => _PushButtonState();
}

class _PushButtonState extends State<PushButton> {
  Curve curve = Curves.easeIn;
  double shadowHeight = 4;
  double position = 4.0;

  void pressed(_) {
    setState(() {
      position = 0.0;
    });
  }

  void unPressed({required void Function() onPressed}) {
    setState(() {
      position = 4.0;
    });
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - shadowHeight;

    return GestureDetector(
      child: SizedBox(
        width: widget.width,
        height: _height + shadowHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled
                      ? darken(widget.color, widget.shadowDegree)
                      : darken(Colors.grey, widget.shadowDegree),
                  borderRadius: widget.shape != BoxShape.circle
                      ? BorderRadius.all(
                          Radius.circular(widget.radius),
                        )
                      : null,
                  shape: widget.shape,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: position,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled ? widget.color : Colors.grey,
                  borderRadius: widget.shape != BoxShape.circle
                      ? BorderRadius.all(
                          Radius.circular(widget.radius),
                        )
                      : null,
                  shape: widget.shape,
                ),
                child: Center(
                  child: widget.child,
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

enum ShadowDegree { light, dark }

Color darken(Color color, ShadowDegree degree) {
  double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}