import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EasyDialog extends StatelessWidget {
  final String? title;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  const EasyDialog({Key? key, this.title, this.onCancel, this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280.r,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 30.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20.r),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (onCancel == null) {
                      Get.back();
                    } else {
                      onCancel!();
                    }
                  },
                  child: Container(
                    height: 34.r,
                    padding: EdgeInsets.symmetric(horizontal: 30.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFd1d1d1),
                        borderRadius: BorderRadius.circular(17.r)),
                    child: const Text(
                      '取消',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40.r,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (onConfirm == null) {
                      Get.back();
                    } else {
                      Get.back();
                      onConfirm!();
                    }
                  },
                  child: Container(
                    height: 34.r,
                    padding: EdgeInsets.symmetric(horizontal: 30.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFc89d42),
                        borderRadius: BorderRadius.circular(17.r)),
                    child: const Text(
                      '确定',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
