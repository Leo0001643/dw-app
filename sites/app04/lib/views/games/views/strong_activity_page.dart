import 'package:aone_common/common.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/games/widgets/strong_activity_app_bar.dart';
import 'package:app04/views/games/widgets/strong_activity_item_widget.dart';
import 'package:app04/widget/misc/page_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/b55_loading.dart';
import '../../activities/widgets/tabbar_title.dart';
import '../controllers/strong_activity_controller.dart';

class StrongActivityPage extends GetView<StrongActivityController> {
  const StrongActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StrongActivityController>(
      autoRemove: false,
      builder: (_) {
        return ThemeScaffold(
          appBar: const StrongActivityAppBar(),
          body: Builder(
            builder: (BuildContext ctx) {
              return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.activityPageController,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
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

  Widget _recommendGridViewHeader() {
    return Obx(() {
      if (controller.recommendSelectIndex == 0) return const SizedBox.shrink();
      var item = controller.topGames[controller.recommendSelectIndex];
      List<Info>? gameList = item.info;
      return Padding(
          padding: EdgeInsets.fromLTRB(17.r, 16.r, 17.r, 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('热门推荐',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(51, 51, 51, 1))),
              GestureDetector(
                onTap: () {
                  var onGameParams2 = gameList![0];
                  onGameParams2.ischangshang = 1;
                  onGameParams2.subTag = onGameParams2.gameTag;
                  onBeforeGameInit(
                    onGameParams: onGameParams2,
                  );
                },
                child: const Text(
                  '更多>>',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)),
                ),
              ),
            ],
          ));
    });
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
            print('currentItem.type == ${currentItem.type}');
            print('currentItem.subTag == ${currentItem.subTag}');

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
                  rightTitle: "更多游戏",
                  type: currentItem.info![0].type ?? 2,
                ),
                SizedBox(
                  height: 14.r,
                ),
                SizedBox(
                  height: (itemHeight + bottomSpace).r,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: currentItem.info?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = currentItem.info![index];
                      return Container(
                          margin: EdgeInsets.only(
                              right: 5.r, bottom: bottomSpace.r),
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
                    imageUrl:
                        staticImageResolver(currentItem.activityImgH5Url![0]),
                    progressIndicatorBuilder: (_, __, ___) =>
                        const Center(child: B55Loading()),
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
                        margin:
                            EdgeInsets.only(right: 5.r, bottom: bottomSpace.r),
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

// Widget _searchView() {
//   return GestureDetector(
//       onTap: () => Get.toNamed(Routes.gameSearch),
//       child: Container(
//           height: 43.r,
//           margin: EdgeInsets.fromLTRB(16.r, 18.r, 16.r, 20.r),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 20.r, right: 8.r),
//                 child: Image.asset(
//                   'assets/images/home/search.png',
//                   color: AppTheme.neutral,
//                   width: 14.r,
//                   height: 14.r,
//                   // fit: BoxFit.fill,
//                 ),
//               ),
//               const Text(
//                 '搜索',
//                 style: TextStyle(color: AppTheme.neutral, fontSize: 14),
//               )
//             ],
//           )));
// }
