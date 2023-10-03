import 'package:aone_common/common.dart';
import 'package:app10/views/activities/controllers/activity_controller.dart';
import 'package:app10/theme/image_util.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../theme/theme_scaffold.dart';
import '../widgets/youhui_tabbar_title.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ActivityLogic());
    Get.put(ActivityController());
    return ThemeScaffold(
      hideBack: Get.currentRoute == Routes.main,
      title: '优惠活动',
      body: Column(
        children: [
          _headerButtonList(),
          Expanded(
            child: _gridView(),
          )
        ],
      ),
    );
  }

  _headerButtonList() {
    var state = ActivityController.to.state;
    return Obx(() {
      return AnimationLimiter(
        child: Container(
          height: 35.r,
          margin: EdgeInsets.symmetric(horizontal: 12.r),
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 横向滚动
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: FadeInAnimation(
                  child: ScaleAnimation(
                    child: _itemButton(
                      state.activityTypes[index].classNameCn!,
                      index,
                    ),
                  ),
                ),
              );
            },
            itemCount: state.activityTypes.length,
          ),
        ),
      );
    });
  }

  _itemButton(String title, int index) {
    var state = ActivityController.to.state;
    var ctr = ActivityController.to;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 10.r),
        padding: EdgeInsets.only(top: 1.5.r),
        child: Obx(() {
          return YouHuiTabBarTitle(
            title: title,
            isCheck: state.tabIndex == index,
          );
        }),
      ),
      onTap: () {
        state.tabIndex = index;
        if (index == 0) {
          ctr.onTypeChange(0);
        } else {
          ctr.onTypeChange(state.activityTypes[index].id!);
        }
      },
    );
  }

  _gridView() {
    var state = ActivityController.to.state;
    return Padding(
      padding: EdgeInsets.only(top: 12.r, left: 12.r, right: 12.r),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => state.pagingController.refresh()),
        child: PagedListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.r),
          builderDelegate: PagedChildBuilderDelegate<ActivityInfo>(
            animateTransitions: true,
            itemBuilder: (BuildContext context, item, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 30,
                    child: gridItem(item),
                  ),
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (_) => Padding(
              padding: EdgeInsets.symmetric(vertical: 150.r),
              child: const NoData(title: '该分类下暂无数据'),
            ),
          ),
          pagingController: state.pagingController,
        ),
      ),
    );
  }

  Widget gridItem(ActivityInfo activityInfo) {
    var controller = ActivityController.to;
    return GestureDetector(
      onTap: () => controller.showDetail(activityInfo.id!),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.r),
        child: SizedBox(
          height: 145.r,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  // clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFFD6AE33))
                      // color: const Color.fromRGBO(242, 245, 248, 1),
                      // borderRadius: BorderRadius.circular(6.r),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ImageUtil.networkFitWidth(
                          staticImageResolver(activityInfo.qtAppSlmg),
                        ),
                      ),
                      //暂时不用显示时间
                      // Container(
                      //   padding: EdgeInsets.all(5.r),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         timeStampIntToStringPeriod(
                      //           activityInfo.qtShowStime!,
                      //           activityInfo.qtShowEtime!,
                      //         ),
                      //         style: TextStyle(
                      //           fontSize: 10.sp,
                      //           color: AppTheme.mainTextColor,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: _labels(
                  activityInfo.qtBiao!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labels(String qtBiao) {
    if (qtBiao.contains('1')) {
      return Image.asset(
        'assets/images/activity/activity_type_1.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    if (qtBiao.contains('2')) {
      return Image.asset(
        'assets/images/activity/activity_type_3.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    if (qtBiao.contains('3')) {
      return Image.asset(
        'assets/images/activity/activity_type_2.png',
        width: 40,
        fit: BoxFit.fill,
      );
    }
    return const SizedBox();
  }
}
