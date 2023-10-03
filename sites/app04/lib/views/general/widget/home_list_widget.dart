import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/home_page_controller.dart';
import 'menu_cell.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listView();
  }

  //底部表格
  Widget _listView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftView(),
        _rightView(),
      ],
    );
  }

  Widget _rightView() {
    final ctrl = HomePageController.to;

    return Expanded(
      child: Obx(
        () {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.r),
            itemCount: ctrl.navConfigList[ctrl.selectIndex].subChildren!.length,
            controller: ctrl.scrollController,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  ctrl.cardClick(
                    ctrl.navConfigList[ctrl.selectIndex].subChildren![index],
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 16.w),
                  height: 145.w,
                  child: Container(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  //左边icon
  Widget _leftView() {
    final ctrl = HomePageController.to;
    return CustomPaint(
      painter: SideTabBarBg(AppTheme.neutral.withAlpha(50)),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
        width: 90.r,
        alignment: Alignment.topCenter,
        child: Center(
          child: ListView.builder(
            itemCount: ctrl.navConfigList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Obx(
                  () {
                    return MenuCell(
                      index: index,
                      navconfig: ctrl.navConfigList[index],
                      listIcon: ctrl.selectIndex == index ? 0 : 1,
                    );
                  },
                ),
                onTap: () {
                  ctrl.scrollController.jumpTo(
                    ctrl.scrollController.position.minScrollExtent,
                  );
                  ctrl.selectIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class SideTabBarBg extends CustomPainter {
  final Color lineColor;

  SideTabBarBg(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.5;

    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height * 1),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant SideTabBarBg oldDelegate) {
    return false;
  }
}
