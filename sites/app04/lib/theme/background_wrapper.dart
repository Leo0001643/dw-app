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
      ),
      child: child,
    );
  }
}
