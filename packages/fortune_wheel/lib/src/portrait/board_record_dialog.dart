part of 'portrait.dart';

class BoardRecordDialog extends StatelessWidget {
  const BoardRecordDialog({Key? key}) : super(key: key);
  static const double baseWidth = 260;

  @override
  Widget build(BuildContext context) {
    final ctrl = PortraitWheelCtrl.to;
    return SizedBox(
      width: baseWidth.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: baseWidth.r,
            height: 320.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(124, 124, 195, 1),
                ),
                BoxShadow(
                  color: Color.fromRGBO(91, 54, 174, 1),
                  blurRadius: 35,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.r,
                right: 12.r,
                top: 4.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _boardTitle(),
                  const BoardRecord(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/landscape/title_left.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
        SizedBox(
          width: 10.r,
        ),
        Text(
          'fortuneWheel.record'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          width: 10.r,
        ),
        Image.asset(
          'assets/images/landscape/title_right.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
      ],
    );
  }
}
