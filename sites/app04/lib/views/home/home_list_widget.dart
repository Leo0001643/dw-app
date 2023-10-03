// import 'package:app04/tab/controllers/home_page_controller.dart';
import 'dart:convert';

import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:aone_common/router/routes.dart';
import 'package:aone_common/utils/assets.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/general/controllers/home_page_controller.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../games/controllers/game_category_controller.dart';

class HomeListWidget extends StatelessWidget {
  int index = 0;

  HomeListWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listView();
  }

  //底部表格
  Widget _listView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rightView(),
      ],
    );
  }

  Widget _rightView() {
    final ctrl = HomePageController.to;
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.w,
          childAspectRatio: 170.5 / 72,
        ),
        itemCount: ctrl.navConfigList[this.index].subChildren!.length,
        controller: ctrl.scrollController,
        itemBuilder: (ctx, index) {
          int type =
              ctrl.navConfigList[this.index].subChildren![index].tag ?? 0;
          print('type33333 === ${type}');
          print('index: ${this.index}');
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
              printInfo(info: "ctrl.selectIndex   ${ctrl.selectIndex}");

              printInfo(
                  info:
                      "11111122222-name: ${ctrl.navConfigList[this.index].subChildren![index].nameCn!}");

              printInfo(
                  info:
                      "11111122222-image: ${ctrl.navConfigList[this.index].subChildren![index].image!}");
              int i=ctrl.navConfigList.indexWhere((element)  => element.isYs=="egame");
              if ((this.index == i) && (index == 0)) {
                Get.toNamed(Routes.strongActivity);
                return;
              }
              ctrl.cardClick(
                ctrl.navConfigList[this.index].subChildren![index],
              );
            },
            child: Container(
              // margin:
              // EdgeInsets.only(left: 10.w, right: 10.w, bottom: 16.w),
              // height: 145.w,
              decoration: BoxDecoration(
                color: AppTheme.cardBackColor,
                borderRadius: const BorderRadius.all(const Radius.circular(4)),
                border: Border.all(
                  color: AppTheme.underLineColor,
                ),
              ),
              child: Stack(alignment: Alignment.centerLeft, children: [
                Positioned(
                    top: 6.w,
                    bottom: 6.w,
                    left: 6.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        DjImage.network(
                          ctrl.navConfigList[this.index].subChildren![index]
                                  .image ??
                              "",
                          width: 60.r,
                          height: 60.r,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const GFLoader();
                          },
                          errorBuilder: (context, object, stack) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.04),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${ctrl.navConfigList[this.index].subChildren![index].nameCn}',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF666666)),
                        )
                      ],
                    )),
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
