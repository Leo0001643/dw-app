part of '../portrait.dart';

class BoardRecordDialogZ01 extends StatelessWidget {
  const BoardRecordDialogZ01({Key? key}) : super(key: key);
  static  double baseWidth = ScreenUtil().screenWidth - 60;

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
            height: 330.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color:const Color(0xFF75B0E0),
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
                  SizedBox(
                    height: 5.r,
                  ),
                  _boardTitle(),
                  SizedBox(
                    height: 5.r,
                  ),
                  const BoardRecordZ01(),
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
          'assets/images/portrait/z01/title_left.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
        SizedBox(
          width: 10.r,
        ),
        Text(
          '记录'.tr,
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
