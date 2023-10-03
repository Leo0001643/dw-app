import 'dart:math';
import 'package:aone_common/common.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:app10/views/general/widget/home_app_bar.dart';
import 'package:app10/views/general/widget/home_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';
import '../../theme/color_schema.dart';
import '../../views/general/widget/advertLayout.dart';
import '../../widget/misc/dj_image.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      appBar: const HomeAppBar(),
      body: RedThumbnailWrapper(
        cancelIconColor: AppTheme.danger,
        child: AdvertLayout(
          child: Container(
            color: AppTheme.homeItemBg,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeCarousel(),
                  _homeMenu(),
                  const HomeTopNewWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeMenu() {
    return Container(
      height: 200.r,
      color: AppTheme.homeItemBg,
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: AnimationLimiter(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomePageController.to.navConfigListCopy.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2.r,
            mainAxisSpacing: 2.r,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (BuildContext context, int index) {
            Navconfig e = HomePageController.to.navConfigListCopy[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: HomePageController.to.navConfigListCopy.length,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        debugPrint('index:$index');
                        HomePageController.to.gameMenuClickIndex(index);
                      },
                      child: Container(
                        // color: Colors.amber,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DjImage.asset(
                              e.image!,
                              // width: 50,
                              // height: 50,
                            ),
                            Text(
                              e.nameCn ?? "",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFFcacaca)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeTopNewWidget extends StatelessWidget {
  const HomeTopNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.itemBgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // jumpTo(pageIndex, title);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Image.asset(
                      'assets/images/home/hot_games.png',
                      width: 165 * 0.6,
                    ),
                  ),
                  const Spacer(),
                  Text('右滑更多',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.7))),
                ],
              ),
            ),
          ),
          _buildGridView()
        ],
      ),
    );
  }

  _buildGridView() {
    final ctrl = HomePageController.to;
    return Obx(() {
      int pageCount = ctrl.homeHotItems.length ~/ 8;
      print('hotAllGameItem pageCount:$pageCount');
      return SizedBox(
        height: 340.r,
        child: PageView.builder(
            itemCount: pageCount,
            itemBuilder: (_, pageIndex) {
              return GridView.builder(
                padding: EdgeInsets.fromLTRB(20.r, 10.r, 20.r, 20.r),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: min(8, ctrl.homeHotItems.length - 8 * pageIndex),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 20.r,
                  mainAxisSpacing: 10.r,
                  childAspectRatio: 0.5,
                  maxCrossAxisExtent: (375 - 60).r / 2,
                  mainAxisExtent: 70.r,
                ),
                itemBuilder: (BuildContext context, int index) {
                  SubChildren item = ctrl.homeHotItems[index + pageIndex * 8];

                  // print('homeHotItems index:$index');
                  // print('homeHotItems pageIndex:$pageIndex');

                  return GestureDetector(
                    onTap: () {
                      ctrl.cardClick(item);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 50.r,
                          width: 50.r,
                          child: DjImage.network(
                            item.image ?? "",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.r),
                          constraints: BoxConstraints(maxWidth: 97.r),
                          child: Text(
                            item.nameCn ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      );
    });
  }

  void jumpTo(int type, String title) {
    final ctrl = HomePageController.to;
    // if (type == 0) {
    // ctrl.getAllGameListHot(999);
    // }
  }

  Widget _childWidget(
      int pageIndex, String title, int total, RxList<AllGameItem> list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      color: AppTheme.itemBgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // jumpTo(pageIndex, title);
            },
            child: Container(
              margin: EdgeInsets.only(top: 15.h, bottom: 10.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/home/hot_games.png',
                    width: 165 * 0.6,
                  ),
                  const Spacer(),
                  Text('右滑更多',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.7))),
                ],
              ),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: min(list.length, 8),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return itemGameWidget(
                  list[index + pageIndex * 8], index, pageIndex);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.5,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w,
                crossAxisCount: 2),
          )
        ],
      ),
    );
  }
}

Widget itemGameWidget(AllGameItem itemSub, int j, int type) {
  final ctrl = HomePageController.to;

  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          // ctrl.checkIndexHot.value = "$j-$type";
        },
        child: Container(
          child: Row(
            children: [
              Container(
                height: 50.r,
                width: 50.r,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                    image: NetworkImage(
                      itemSub.imgCn ?? "",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.r),
                child: Text(
                  itemSub.nameCn ?? "",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
