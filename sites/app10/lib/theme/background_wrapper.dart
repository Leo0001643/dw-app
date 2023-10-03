import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget? child;

  const BackgroundWrapper({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage(
        //     'assets/images/user/user_center_bg.png',
        //   ),
        //   alignment: Alignment.topCenter,
        //   fit: BoxFit.fitWidth,
        // ),
      ),
      child: child,
    );
  }
}
