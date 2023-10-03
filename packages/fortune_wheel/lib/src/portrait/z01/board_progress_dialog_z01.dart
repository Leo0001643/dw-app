part of '../portrait.dart';

class BoardProgressDialogZ01 extends StatelessWidget {
  const BoardProgressDialogZ01({Key? key}) : super(key: key);
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
            color:const Color(0xFFF4A417),
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
               const Expanded(
                  child: BoardProgressZ01(),
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
          '进度'.tr,
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
