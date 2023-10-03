part of 'portrait.dart';

class BoardManualDialog extends StatelessWidget {
  const BoardManualDialog({Key? key}) : super(key: key);

  static const double baseHeight = 260;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.r,
        right: 12.r,
      ),
      child: Center(
        child: Container(
          height: baseHeight.r,
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
              children: [
                _boardTitle(),
                SizedBox(
                  height: 10.r,
                ),
                SizedBox(
                  height: 220.r,
                  child: const BoardManual(),
                ),
              ],
            ),
          ),
        ),
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
          'fortuneWheel.manual'.tr,
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
