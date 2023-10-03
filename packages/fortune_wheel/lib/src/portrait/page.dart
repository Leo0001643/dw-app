part of 'portrait.dart';

class FortuneWheelPortrait extends StatelessWidget {
  // 关闭事件
  final void Function() onClose;

  const FortuneWheelPortrait({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PortraitWheelCtrl());
    Get.put(FortuneWheelLogic());
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(-0.r, 0),
            child: const WheelWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(-0.r, -50.r),
              child: CloseBtn(onClose: onClose),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: Offset(-20.r, 300.r),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(const BoardRecordDialog());
                      debugPrint("点击了记录");
                    },
                    child: Image.asset(
                      'assets/images/portrait/bnt_jl.png',
                      package: 'fortune_wheel',
                      width: 40.r,
                      height: 40.r,
                    ),
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(const BoardManualDialog());
                      debugPrint("点击了说明");
                    },
                    child: Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/portrait/bnt_sm.png',
                        width: 40.r,
                        height: 40.r,
                        package: 'fortune_wheel',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(const BoardProgressDialog());
                      debugPrint("点击了进度");
                    },
                    child: Image.asset(
                      'assets/images/portrait/bnt_jd.png',
                      width: 40.r,
                      height: 40.r,
                      package: 'fortune_wheel',
                    ),
                  ),
                ],
              ),
            ),
          ), //6029766  2729030
        ],
      ),
    );
  }
}
