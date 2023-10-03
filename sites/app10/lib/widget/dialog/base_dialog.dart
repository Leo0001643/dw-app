
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: AppTheme.shadowColor,
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
          style: AppTheme.header,
        ),
      ),
    );
  }
}
