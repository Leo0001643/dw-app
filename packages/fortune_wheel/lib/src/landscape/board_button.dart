part of 'landscape.dart';

class BoardButton extends StatelessWidget {
  final String imgName;
  final String text;
  final Color textColor;
  final int index;
  final double width;

  const BoardButton({
    Key? key,
    required this.imgName,
    required this.text,
    required this.textColor,
    required this.index,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = LandscapeWheelCtrl.to;
    final logic = FortuneWheelLogic.to;
    return GestureDetector(
      onTap: () {
        ctrl.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
        logic.state.title = text;
      },
      child: Container(
        width: width,
        height: 30.r,
        padding: EdgeInsets.only(bottom: 6.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: StyleUtils.decorationImage(imgName),
        ),
        child: Text(
          text.tr,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
