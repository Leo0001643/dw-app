part of '../portrait.dart';

class FortuneWheelPortraitZ01 extends StatelessWidget {
  // 关闭事件
  final void Function() onClose;

  const FortuneWheelPortraitZ01({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PortraitWheelCtrl());
    Get.put(FortuneWheelLogic());

    return Container(
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(-0.r, 0),
              child: const WheelWidgetZ01(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: Offset(-30.r, ScreenUtil().screenHeight/2.0 - 150),
                child: GestureDetector(
                  onTap: onClose,
                  child: Image.asset(
                    'assets/images/portrait/z01/close_btn.png',
                    width: 30.r,
                    package: 'fortune_wheel',
                  ),
                )
                // CloseBtnRight(onClose: onClose),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0.r, 190.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardRecordDialogZ01());
                        debugPrint("点击了记录");
                      },
                      child: Container(
                        width: 90.r,
                        height: 30.r,
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFF75B0E0),
                        ),
                        child: Text(
                          '记录'.tr,
                          style: TextStyle(
                            color: ColorSchema.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardManualDialogZ01());
                        debugPrint("点击了说明");
                      },
                      child: Container(
                        width: 90.r,
                        height: 30.r,
                        padding:const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF7BC058)
                        ),
                        child: Text(
                          '说明'.tr,
                          style: TextStyle(
                            color: ColorSchema.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardProgressDialogZ01());
                        debugPrint("点击了进度");
                      },
                      child: Container(
                        width: 90.r,
                        height: 30.r,
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFF4A417)
                        ),
                        child: Text(
                          '进度'.tr,
                          style: TextStyle(
                            color: ColorSchema.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
