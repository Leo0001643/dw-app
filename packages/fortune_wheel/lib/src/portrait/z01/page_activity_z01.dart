part of '../portrait.dart';

class FortuneWheelPortraitActivityZ01 extends StatelessWidget {
  // 关闭事件
  final void Function() onClose;

  const FortuneWheelPortraitActivityZ01({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PortraitWheelCtrl());
    Get.put(FortuneWheelLogic());

    return Container(
      decoration: BoxDecoration(
        image: StyleUtils.decorationImagePortrait('bg.png'),
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(-0.r, 0),
              child: const WheelWidget(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: Offset(-20.r, 20.r),
                child: CloseBtnRight(onClose: onClose),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(30.r, -50.r),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardProgressDialog());
                        debugPrint("点击了进度");
                      },
                      child: Container(
                        width: 90.r,
                        height: 42.r,
                        padding: EdgeInsets.only(bottom: 6.r),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image:
                              StyleUtils.decorationImagePortrait('bg_jd.png'),
                        ),
                        child: Text(
                          '进度',
                          style: TextStyle(
                            color: ColorSchema.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 26.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardRecordDialog());
                        debugPrint("点击了记录");
                      },
                      child: Container(
                        width: 90.r,
                        height: 42.r,
                        padding: EdgeInsets.only(bottom: 6.r),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image:
                              StyleUtils.decorationImagePortrait('bg_jl.png'),
                        ),
                        child: Text(
                          '记录',
                          style: TextStyle(
                            color: ColorSchema.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 26.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const BoardManualDialog());
                        debugPrint("点击了说明");
                      },
                      child: Container(
                        width: 90.r,
                        height: 42.r,
                        padding: EdgeInsets.only(bottom: 6.r),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image:
                              StyleUtils.decorationImagePortrait('bg_sm.png'),
                        ),
                        child: Text(
                          '说明',
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
