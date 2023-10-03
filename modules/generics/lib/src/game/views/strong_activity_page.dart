import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/theme/theme_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/strong_activity_controller.dart';
import '../widgets/strong_activity_app_bar.dart';
import '../widgets/strong_activity_item_widget.dart';
import '../widgets/tabbar_title.dart';

class StrongActivityPage extends GetView<StrongActivityController> {
  const StrongActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StrongActivityController>(
      autoRemove: false,
      builder: (_) {
        return ThemeScaffold(
          appBar: const StrongActivityAppBar(),
          backgroundColor: AoneAppTheme.appTheme.strongBgColor ?? Colors.white,
          body: Builder(
            builder: (BuildContext ctx) {
              return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.activityPageController,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      //强档活动
                      ? _strongSelfListView()
                      : _strongActivityListView();
                },
              );
            },
          ),
        );
      },
    );
  }

  _strongSelfListView() {
    return Obx(() {
      return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
          itemCount: controller.topGames.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            bool isFirst = index == 0;
            var currentItem = controller.topGames[index];
            double itemHeight = 104.r;
            double bottomSpace = 20;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBarTitle(
                  isFirst: isFirst,
                  index: index,
                  title: currentItem.nameCn!,
                  isCheck: true,
                  rightTitle: (AoneAppTheme.appTheme.strongListMoreIsTop??true)? "更多游戏" : "",
                  type: currentItem.info![0].type ?? 2,
                ),
                Container(
                  height: 1,
                  color: AoneAppTheme.appTheme.strongListLineColor ?? Colors.transparent,
                ),
                SizedBox(
                  height: 14.r,
                ),
                SizedBox(
                  height: (itemHeight + bottomSpace).r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: isFirst
                            ? ObxValue<RxInt>(
                                (currentIndex)  {
                                return Stack(
                                  children: [
                                    CarouselSlider.builder(
                                        options: CarouselOptions(height: 184.r, autoPlay: true, viewportFraction: 1,
                                            onPageChanged: (value, reason) {
                                              currentIndex.value = value;
                                            }),
                                        itemCount: (currentItem.info?.length??0)~/4,
                                        itemBuilder: (BuildContext context, int index, int realIndex) {
                                          return ListView.builder(
                                            physics: const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: min((currentItem.info?.length??0)-(4*(index+1)), 4),
                                            itemBuilder: (BuildContext context, int i) {
                                              var item = currentItem.info![(4*index)+i];
                                              return Container(
                                                  margin: EdgeInsets.only(right: 5.r, bottom: bottomSpace.r),
                                                  width: 84.r,
                                                  height: itemHeight.r,
                                                  child: StrongActivityItemWidget(
                                                      title: item.nameCn!,
                                                      imgUrl: item.imgCn!,
                                                      onPress: () {
                                                        onBeforeGameInit(
                                                          onGameParams: item,
                                                        );
                                                      }));
                                            },
                                          );
                                        },
                                      ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 2,
                                      child: Container(
                                        width: 40.r,
                                        height: 18.r,
                                        alignment: Alignment.center,
                                        child: CarouselIndicator(
                                          cornerRadius: 40,
                                          width: 8,
                                          height: 8,
                                          activeColor:   AoneAppTheme.appTheme.strongListFirstGameColor??Colors.white,
                                          color: Colors.grey,
                                          count: (currentItem.info?.length??0)~/4,
                                          index: currentIndex.value,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },0.obs
                            )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: currentItem.info?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = currentItem.info![index];
                                  return Container(
                                      margin: EdgeInsets.only(right: 5.r, bottom: bottomSpace.r),
                                      width: 84.r,
                                      height: itemHeight.r,
                                      child: StrongActivityItemWidget(
                                          title: item.nameCn!,
                                          imgUrl: item.imgCn!,
                                          onPress: () {
                                            onBeforeGameInit(
                                              onGameParams: item,
                                            );
                                          }));
                                },
                              ),
                      ),
                      (AoneAppTheme.appTheme.strongListMoreIsTop??true) || isFirst
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                currentItem.ischangshang=1;
                                currentItem.type=2;
                                currentItem.subTag=currentItem.gameTag;
                                onBeforeGameInit(
                                  onGameParams: currentItem,
                                );
                              },
                              child: Container(
                                width: 40,
                                height: 84.r,
                                decoration: AoneAppTheme.appTheme.strongListRightMoreGameDecoration,
                                child: Center(
                                  child: Text(
                                    "更多\n游戏",
                                    style: TextStyle(fontSize: 12, color: AoneAppTheme.appTheme.strongListRightMoreGameTextColor),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ],
            );
          });
    });
  }

  _strongActivityListView() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(16.r, 15.r, 16.r, 20.r),
        itemCount: controller.strongList.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          if (index == 0) return const SizedBox.shrink();
          var currentItem = controller.strongList[index];
          print('currentItem.type == ${currentItem.type}');
          print('currentItem.nameCn == ${currentItem.nameCn}');
          double itemHeight = 104.r;
          double bottomSpace = 20;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarTitle(
                index: index,
                title: currentItem.nameCn!,
                isCheck: true,
                rightTitle: [2, 6].contains(currentItem.type!) ? "更多" : '',
                isShowRight: true,
                type: currentItem.type ?? 2,
              ),
              Container(
                height: 1,
                color: AoneAppTheme.appTheme.strongListLineColor ?? Colors.transparent,
              ),
              SizedBox(
                height: 14.r,
              ),
              GestureDetector(
                onTap: () {
                  if (currentItem.activityUrl!.isNotEmpty) {
                    Get.toNamed(
                      Routes.webPage,
                      arguments: WebData(currentItem.activityUrl!),
                    );
                  }
                },
                child: Container(
                  height: 90.r,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: staticImageResolver(currentItem.activityImgH5Url![0]),
                    progressIndicatorBuilder: (_, __, ___) => const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.r,
              ),
              SizedBox(
                height: (itemHeight + bottomSpace).r,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: currentItem.item?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = currentItem.item![index];
                    return Container(
                        margin: EdgeInsets.only(right: 5.r, bottom: bottomSpace.r),
                        width: 84.r,
                        height: itemHeight.r,
                        child: StrongActivityItemWidget(
                            title: item.nameCn!,
                            imgUrl: item.imgCn!,
                            onPress: () {
                              onBeforeGameInit(
                                onGameParams: item,
                              );
                            }));
                  },
                ),
              )
            ],
          );
        });
  }
}
