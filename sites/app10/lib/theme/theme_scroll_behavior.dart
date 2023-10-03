import 'package:flutter/material.dart';

class ThemeScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: RangeMaintainingScrollPhysics());
  }
}
