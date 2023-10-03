part of 'portrait.dart';

class BoardProgressDialog extends StatelessWidget {
  const BoardProgressDialog({Key? key}) : super(key: key);
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _boardTitle(),
               const Expanded(
                  child: BoardProgress(),
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
          'fortuneWheel.progress'.tr,
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
