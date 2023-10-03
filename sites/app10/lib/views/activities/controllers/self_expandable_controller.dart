import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';

typedef SelfExpandOnTap = void Function(
    SelfExpandableController expandableController);

class SelfExpandableController extends ExpandableController {
  SelfExpandOnTap onTap;
  SelfExpandableController({
    required this.onTap,
  });

  void setOntap(SelfExpandOnTap ontap) {
    this.onTap = ontap;
  }

  @override
  void toggle() {
    onTap.call(this);
    super.toggle();
  }
}
