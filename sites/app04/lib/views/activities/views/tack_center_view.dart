import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/site_config.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/no_data_for_task_cneter.dart';
import '../controllers/tack_center_controller.dart';
import '../widgets/progress_card.dart';

class TackCenterView extends GetView<TackCenterController> {
  const TackCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TackCenterController>(builder: (_) {
      return ThemeScaffold(
        title: '任务中心',
        body: Container(
          color: AoneAppTheme.appTheme.tcBgColor,
          child: Row(
            children: <Widget>[_leftView(), _buildGridView()],
          ),
        ),
      );
    });
  }

  //左边icon
  Widget _leftView() {
    return Container(
      color: Colors.transparent,
      width: 64.w,
      height: Get.height,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: controller.state.sideBarItems.length,
        itemBuilder: (context, index) {
          return _buildSideBarItem(controller.state.sideBarItems[index]);
        },
      ),
    );
  }

  _buildSideBarItem(TaskCenterSideBarItem item) {
    return GestureDetector(
      onTap: () => controller.onTabClick(item.type, item.condition),
      child: Obx(
        () {
          var isActive = controller.activeType == item.type;
          String icon = 'active_' + item.gameType;
          return Center(
            child: Container(
              height: 47.r,
              width: 40.r,
              margin: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/activity/task_center/$siteTagAssets/${isActive ? 'activity_task_select_bg' : 'activity_task_unselect_bg'}.png',
                ),
                fit: BoxFit.fill,
              )),
              child: Column(children: [
                SizedBox(
                  height: 5.r,
                ),
                Image.asset(
                  'assets/images/activity/task_center/activity_task_$icon.png',
                  height: 20.w,
                  width: 20.w,
                  color: isActive
                      ? AoneAppTheme.appTheme.tcMenuSelectTitleColor
                      : AoneAppTheme.appTheme.tcMenuTitleColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 2.r,
                ),
                Text(
                  item.name,
                  style: TextStyle(
                    color: isActive
                        ? AoneAppTheme.appTheme.tcMenuSelectTitleColor
                        : AoneAppTheme.appTheme.tcMenuTitleColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  _buildGridView() {
    return Container(
      width: Get.width - 64.r - 12.r,
      // height: Get.height,
      child: Obx(() {
        return EasyRefresh.custom(
          controller: controller.easyRefreshController,
          header: ClassicalHeader(
              infoText: "",
              refreshedText: '加载完成',
              textColor: Colors.black54,
              refreshingText: '',
              refreshReadyText: '释放加载',
              refreshText: '下拉刷新',
              showInfo: false),
          onRefresh: () async {},
          slivers: <Widget>[
            if (controller.filteredList.isEmpty)
              const SliverFillRemaining(
                child: NoDataForTaskCenter(),
              )
            else
              SliverSafeArea(
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var item = controller.filteredList[index];
                    return Container(
                        margin: EdgeInsets.only(top: 10.w),
                        child: ProgressCard(item: item));
                  },
                      childCount: controller.filteredList.isEmpty
                          ? 1
                          : controller.filteredList.length),
                ),
              ),
          ],
        );
      }),
    );
  }
}
