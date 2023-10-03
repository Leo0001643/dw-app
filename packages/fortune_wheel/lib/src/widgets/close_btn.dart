

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CloseBtn extends StatelessWidget {

  final void Function() onClose;

  const CloseBtn({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.r,
      height: 24.r,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: ColorSchema.purple,
            width: 2.0,
          )
          // image: StyleUtils.decorationImage('close_bg.png')
        ),
        child: FittedBox(
          child: Center(
            child: IconButton(
              onPressed: () => onClose(),
              icon: const Icon(
                Icons.clear,
                color: Color.fromRGBO(190, 64, 198, 0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
