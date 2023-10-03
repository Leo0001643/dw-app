import 'package:aone_common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordMenuButton extends StatelessWidget {
  final String? title;
  final double? radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isSelected;
  final VoidCallback? onTap;
  final BoxDecoration? decoration;
  const RecordMenuButton(
      {Key? key,
      required this.title,
      this.radius,
      this.fontSize,
      this.width,
      this.height,
      this.isSelected = false,
      this.onTap,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: width ?? 76.r,
        height: height ?? 30.r,
        decoration: decoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 5.r),
                border: Border.all(
                    width: 1,
                    color: isSelected == true
                        ? Colors.transparent
                        : Color(0xFFEAEAEA)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: isSelected == true
                        ? [
                            Color(0xFFD3A372),
                            Color(0xFF9C7B5A),
                          ]
                        : [
                            Colors.white,
                            Colors.white,
                          ])),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
                fontSize: fontSize ?? 12.sp,
                color: isSelected == true ? Colors.white : Color(0xFF969696)),
          ),
        ),
      ),
    );
  }
}

class RecordArrowButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  bool? isOpen;
  double? fontSize;

  ///是否没有arrow
  bool? isHasNotArrow;

  RecordArrowButton(
      {Key? key,
      required this.title,
      this.isOpen,
      this.onTap,
      this.fontSize,
      this.isHasNotArrow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: 94.r,
        height: 30.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            gradient: AoneAppTheme.appTheme.recordsPrimaryGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: fontSize ?? 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AoneAppTheme.appTheme.recordsSelectedTextColor),
            ),
            if (isHasNotArrow != true)
              SizedBox(
                width: 4.r,
              ),
            if (isHasNotArrow != true)
              Image.asset(
                isOpen == true
                    ? 'assets/images/user/arrow_down.png'
                    : 'assets/images/user/arrow_up.png',
                width: 8.r,
                height: 4.r,
              )
          ],
        ),
      ),
    );
  }
}

class RecordCancelAndDoneWidget extends StatelessWidget {
  final VoidCallback? onCancelTap;
  final VoidCallback? onDoneTap;
  final String? cancelTitle;
  final String? doneTitle;
  const RecordCancelAndDoneWidget({
    Key? key,
    this.onCancelTap,
    this.onDoneTap,
    this.cancelTitle,
    this.doneTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (onCancelTap != null) {
                onCancelTap!();
              }
            },
            child: Container(
              color: Color(0xFFEAEAEA),
              child: Center(
                child: Text(
                  cancelTitle ?? '取消',
                  style: TextStyle(
                      color: AoneAppTheme.appTheme.recordsSubTextColor,
                      fontSize: 15.sp),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (onDoneTap != null) {
                onDoneTap!();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFFD3A372),
                Color(0xFF9C7B5A),
              ])),
              child: Center(
                child: Text(
                  doneTitle ?? '确定',
                  style: TextStyle(
                      color: AoneAppTheme.appTheme.recordsSelectedTextColor,
                      fontSize: 15.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
