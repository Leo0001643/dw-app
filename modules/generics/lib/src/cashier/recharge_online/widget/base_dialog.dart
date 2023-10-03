import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';

class BaseDialog extends StatelessWidget {
  final Widget? child;
  final String? title;

  const BaseDialog({
    Key? key,
    this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 403.r,
            width: 311.r,
            decoration: BoxDecoration(
              color: RechargeTheme().backgroundColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0),
                  blurRadius: 10,
                ),
              ],
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                image: AssetImage(
                  'assets/images/common/dialog_header.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _title(),
                Expanded(child: child ?? const SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return SizedBox(
      height: 45.r,
      child: Center(
        child: Text(
          title ?? '标题',
          style: TextStyle(
            fontSize: 16.sp,
            color: RechargeTheme().dialogTitleTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
