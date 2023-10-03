part of 'landscape.dart';

class FortuneWheelBoard extends StatelessWidget {
  const FortuneWheelBoard({Key? key}) : super(key: key);
  static const double baseWidth = 320;

  @override
  Widget build(BuildContext context) {
    final ctrl = LandscapeWheelCtrl.to;
    return SizedBox(
      width: baseWidth.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: baseWidth.r,
            height: 280.r,
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
                left: 60.r,
                right: 12.r,
                top: 4.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _boardTitle(),
                  Expanded(
                    child: PageView.builder(
                      controller: ctrl.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.r,
                          ),
                          child: [
                            const BoardProgress(),
                            const BoardManual(),
                            const BoardRecord(),
                          ][index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          _typeButtonRow(),
        ],
      ),
    );
  }

  Widget _typeButtonRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: 60.r,
        top: 14.r,
        right: 10.r,
      ),
      child: LayoutBuilder(builder: (context, constraint) {
        final width = (constraint.maxWidth) * 0.3;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoardButton(
              imgName: 'btn_purple.png',
              text: 'fortuneWheel.progress',
              textColor: ColorSchema.purple,
              index: 0,
              width: width,
            ),
            BoardButton(
              imgName: 'btn_orange.png',
              text: 'fortuneWheel.manual',
              textColor: ColorSchema.orange,
              index: 1,
              width: width,
            ),
            BoardButton(
              imgName: 'btn_red.png',
              text: 'fortuneWheel.record',
              textColor: ColorSchema.pink,
              index: 2,
              width: width,
            ),
          ],
        );
      }),
    );
  }

  Widget _boardTitle() {
    final logic = FortuneWheelLogic.to;
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
        Obx(
          () => Text(
            logic.state.title.toString().tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
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
