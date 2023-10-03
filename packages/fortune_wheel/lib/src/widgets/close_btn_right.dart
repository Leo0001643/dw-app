import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CloseBtnRight extends StatelessWidget {
  final void Function() onClose;

  const CloseBtnRight({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.r,
      height: 32.r,
      child:GestureDetector(
        onTap: () {
          onClose();
        },
        child: const Icon(
          Icons.cancel,
          color: ColorSchema.white,
        ),
      ),
    );
  }
}
