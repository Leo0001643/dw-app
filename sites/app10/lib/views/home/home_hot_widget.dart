import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:aone_common/router/routes.dart';
import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../games/controllers/game_category_controller.dart';

List<String> _tiyuImgList = [
  "assets/images/home/tiyu_icon_1.png",
  "assets/images/home/tiyu_icon_2.png",
  "assets/images/home/tiyu_icon_3.png",
  "assets/images/home/tiyu_icon_4.png",
  "assets/images/home/tiyu_icon_5.png",
];

class HomeHotWidget extends StatelessWidget {
  int index = 0;

  HomeHotWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 3) {
      return _tiYuTotalView();
    }
    return _rightView();
  }

  Widget _tiYuTotalView() {
    final ctrl = HomePageController.to;
    final List<SubChildren> gridList = ctrl.navConfigList[index].subChildren!;
    gridList.removeAt(0);
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.strongActivity),
            child: DjImage.asset(
              _tiyuImgList[0],
              height: 163.w,
              fit: BoxFit.contain,
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.w,
            ),
            itemCount: gridList.length,
            padding: EdgeInsets.zero,
            controller: ctrl.scrollController,
            shrinkWrap: true,
            itemBuilder: (ctx, childIndex) {
              int type = gridList[childIndex].tag ?? 0;
              String path = 'assets/images/home/icon_label_hot.png';
              if (type == 2) {
                path = 'assets/images/home/icon_label_hot.png';
              } else if (type == 3) {
                path = 'assets/images/home/icon_label_suggest.png';
              } else if (type == 4) {
                path = 'assets/images/home/icon_label_latest.png';
              }
              return GestureDetector(
                onTap: () => ctrl.cardClick(
                  gridList[childIndex],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DjImage.network(
                      gridList[childIndex].image == null
                          ? ""
                          : gridList[childIndex].image!,
                      width: 170.w,
                      height: 170.w,
                      // 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fm00%2Fda%2Fc2%2F36c95af0bffc53383ef0e028cf86b5e7.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664709381&t=9f764b601b6e9991a19a0b9354c5344d',
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
                    type != 0
                        ? Positioned(
                            top: 0,
                            right: 0,
                            child: DjImage.asset(
                              path,
                              width: 40.w,
                              height: 40.w,
                              fit: BoxFit.contain,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _tiYuHeaderView() {
    final ctrl = HomePageController.to;
    return GestureDetector(
      onTap: () {
        printInfo(info: "ctrl.selectIndex   ${ctrl.selectIndex}");
        if ((index == 3) && (index == 0)) {
          Get.toNamed(Routes.strongActivity);
          return;
        }
        ctrl.cardClick(
          ctrl.navConfigList[index].subChildren![index],
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
        // children: [

        // ],
      ),
      // child: Stack(alignment: Alignment.center, children: [
      //   Positioned(
      //       width: 120.r,
      //       height: 163.r,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const SizedBox(
      //             width: 8,
      //           ),
      //           DjImage.network(
      //             ctrl.navConfigList[this.index].subChildren![index].image ==
      //                     null
      //                 ? ""
      //                 : ctrl
      //                     .navConfigList[this.index].subChildren![index].image!,
      //             width: 60.r,
      //             height: 60.r,
      //             // 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fm00%2Fda%2Fc2%2F36c95af0bffc53383ef0e028cf86b5e7.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664709381&t=9f764b601b6e9991a19a0b9354c5344d',
      //             fit: BoxFit.contain,
      //             loadingBuilder: (context, child, loadingProgress) {
      //               if (loadingProgress == null) return child;
      //               return const GFLoader();
      //             },
      //             errorBuilder: (context, object, stack) {
      //               return Container(
      //                 decoration: BoxDecoration(
      //                   color: Colors.black.withOpacity(0.04),
      //                 ),
      //               );
      //             },
      //           ),
      //           const SizedBox(
      //             width: 8,
      //           ),
      //           Text(
      //             '${ctrl.navConfigList[this.index].subChildren![index].nameCn}',
      //             style: TextStyle(fontSize: 14, color: Colors.white),
      //           )
      //         ],
      //       )),
      //   Positioned(
      //     top: 0.w,
      //     right: 0.w,
      //     width: 351.r,
      //     height: 163.r,
      //     child: DjImage.asset(
      //       "assets/images/home/tiyu_icon_1.png",
      //       width: 351.r,
      //       height: 163.r,
      //       fit: BoxFit.fill,
      //     ),
      //   )
      // ]),
    );
  }

  Widget _tiYuView() {
    final ctrl = HomePageController.to;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30.r,
          childAspectRatio: 1.22,
        ),
        itemCount: ctrl.navConfigList[this.index].subChildren!.length,
        padding: EdgeInsets.symmetric(vertical: 8.r),
        controller: ctrl.scrollController,
        itemBuilder: (ctx, index) {
          int type =
              ctrl.navConfigList[this.index].subChildren![index].tag ?? 0;
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
              if ((this.index == 3) && (index == 0)) {
                Get.toNamed(Routes.strongActivity);
                return;
              }
              ctrl.cardClick(
                ctrl.navConfigList[this.index].subChildren![index],
              );
            },
            child: Stack(alignment: Alignment.center, children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  DjImage.network(
                    ctrl.navConfigList[this.index].subChildren![index].image ==
                            null
                        ? ""
                        : ctrl.navConfigList[this.index].subChildren![index]
                            .image!,
                    width: 60.r,
                    height: 60.r,
                    // 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fm00%2Fda%2Fc2%2F36c95af0bffc53383ef0e028cf86b5e7.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664709381&t=9f764b601b6e9991a19a0b9354c5344d',
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
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
          );
        },
      ),
    );
  }

  Widget _rightView() {
    final ctrl = HomePageController.to;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 30.r,
          childAspectRatio: 1.22,
        ),
        itemCount: ctrl.navConfigList[this.index].subChildren!.length,
        padding: EdgeInsets.symmetric(vertical: 8.r),
        controller: ctrl.scrollController,
        itemBuilder: (ctx, index) {
          int type =
              ctrl.navConfigList[this.index].subChildren![index].tag ?? 0;
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
              if ((this.index == 3) && (index == 0)) {
                Get.toNamed(Routes.strongActivity);
                return;
              }
              ctrl.cardClick(
                ctrl.navConfigList[this.index].subChildren![index],
              );
            },
            child: Stack(alignment: Alignment.center, children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  DjImage.network(
                    ctrl.navConfigList[this.index].subChildren![index].image ==
                            null
                        ? ""
                        : ctrl.navConfigList[this.index].subChildren![index]
                            .image!,
                    width: 60.r,
                    height: 60.r,
                    // 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fm00%2Fda%2Fc2%2F36c95af0bffc53383ef0e028cf86b5e7.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664709381&t=9f764b601b6e9991a19a0b9354c5344d',
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
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              )),
              type != 0
                  ? Positioned(
                      top: 0.w,
                      right: 0.w,
                      child: DjImage.asset(
                        path,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox()
            ]),
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
