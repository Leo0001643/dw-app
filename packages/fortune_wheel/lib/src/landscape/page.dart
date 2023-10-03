 part of 'landscape.dart';

class FortuneWheelLandscape extends StatelessWidget {
  // 关闭事件
  final void Function() onClose;

  const FortuneWheelLandscape({
    Key? key,
    required this.onClose,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LandscapeWheelCtrl());
    Get.put(FortuneWheelLogic());
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(120.r, 0),
            child: const FortuneWheelBoard(),
          ),
          Transform.translate(
            offset: Offset(-120.r, 0),
            child: const WheelWidget(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.translate(
              offset: Offset(-45.r, 15.r),
              child: CloseBtn(onClose: onClose),
            ),
          ),
        ],
      ),
    );
  }
}
