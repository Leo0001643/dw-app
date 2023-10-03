// import 'package:app03/tab/controllers/home_page_controller.dart';
import 'dart:convert';
import 'dart:math';

import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:aone_common/router/routes.dart';
import 'package:aone_common/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/color_schema.dart';
import '../../widget/misc/dj_image.dart';
import '../general/controllers/home_page_controller.dart';

class HomeListWidget extends StatelessWidget {
  int index = 0;

  HomeListWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
        child: Column(
          children: [
            _rightView(),
            Visibility(
              visible: true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // HotGameListDialog.show(index);
                },
                child: Container(
                  width: double.infinity,
                  height: 40.r,
                  decoration: BoxDecoration(
                      color: const Color(0XFF2B2B2B),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Center(
                    child: Text(
                      "更多游戏+",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0XFFC6C5C5)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _rightView() {
    final ctrl = HomePageController.to;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.r,
        crossAxisSpacing: 15.r,
        childAspectRatio: 1,
      ),
      itemCount: min(8, ctrl.navConfigList[index].subChildren!.length),
      padding: EdgeInsets.symmetric(vertical: 8.r),
      controller: ctrl.scrollController,
      itemBuilder: (ctx, index) {
        int type = ctrl.navConfigList[this.index].subChildren![index].tag ?? 0;

        String path = 'assets/images/home/icon_label_hot.png';
        if (type == 2) {
          path = 'assets/images/home/icon_label_hot.png';
        } else if (type == 3) {
          path = 'assets/images/home/icon_label_suggest.png';
        } else if (type == 4) {
          path = 'assets/images/home/icon_label_latest.png';
        }
        return GestureDetector(
          onTap: () {
            if ((this.index == 4) && (index == 0)) {
              Get.toNamed(Routes.strongActivity);
              return;
            }
            ctrl.cardClick(
              ctrl.navConfigList[this.index].subChildren![index],
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme.cardBackColor,
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                image: DecorationImage(
                    image: NetworkImage(
                      ctrl.navConfigList[this.index].subChildren![index]
                              .image ??
                          "",
                    ),
                    fit: BoxFit.fill)),
            child: Stack(alignment: Alignment.centerLeft, children: [
              Positioned(top: 6.w, bottom: 6.w, left: 6.w, child: Container()),
              type != 0
                  ? Positioned(
                      top: 0.w,
                      right: 0.w,
                      child: DjImage.asset(
                        path,
                        width: 40.r,
                        height: 40.r,
                        fit: BoxFit.fill,
                      ),
                    )
                  : const SizedBox()
            ]),
          ),
        );
      },
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
