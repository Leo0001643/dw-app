import 'package:flutter/material.dart';
class ThemeGradientText extends StatelessWidget {
  final Widget? child;
  final List<Color>colors;

  const ThemeGradientText({
    Key? key,
    this.child,
    this.colors=const [Color(0xffE8B36E), Color(0xffF9EAC4),],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: colors,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Center(
        child: child,
      ),
    );
  }
}
