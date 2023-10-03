part of '../portrait.dart';

class BoardManualDialogZ01 extends StatelessWidget {
  const BoardManualDialogZ01({Key? key}) : super(key: key);

  static const double baseHeight = 280;

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
            color: const Color(0xFF7BC058),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.r,
              right: 12.r,
              top: 4.r,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5.r,
                ),
                _boardTitle(),
                SizedBox(
                  height: 5.r,
                ),
                SizedBox(
                  height: 240.r,
                  child: const BoardManualZ01(),
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
          'assets/images/portrait/z01/title_left.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
        SizedBox(
          width: 10.r,
        ),
        Text(
          '说明'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          width: 10.r,
        ),
        Image.asset(
          'assets/images/portrait/z01/title_right.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
      ],
    );
  }
}
