import 'package:aone_common/common.dart';
import 'package:app10/views/activities/controllers/tack_center_controller.dart';
import 'package:app10/views/activities/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../theme/theme_scaffold.dart';
import '../../../widget/no_data_for_task_cneter.dart';

class TackCenterView extends GetView<TackCenterController> {
  const TackCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TackCenterController>(builder: (_) {
      return ThemeScaffold(
        title: '任务中心',
        body: Container(
          color: Colors.black,
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
      width: 64.r,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 12.r),
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
          return Container(
            height: 47.r,
            width: 40.r,
            margin: EdgeInsets.only(bottom: 10.r),
            // alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/activity/${isActive ? 'activity_task_select_bg' : 'activity_task_select_bg_unselect'}.png',
              ),
              // fit: BoxFit.fill,
            )),
            child: Column(children: [
              SizedBox(
                height: 5.r,
              ),
              Image.asset(
                'assets/images/activity/activity_task_$icon.png',
                height: 20.w,
                width: 20.w,
                fit: BoxFit.fill,
                color: isActive
                    ? const Color(0xFF000000)
                    : const Color(0xFF757575),
              ),
              Text(
                item.name,
                style: TextStyle(
                  color: isActive ? Colors.black : const Color(0xFF757575),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  _buildGridView() {
    return SizedBox(
      width: Get.width - 64.r - 12.r,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.r,
          bottom: 5.r,
        ),
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
                          // height: 116.h,
                          margin: EdgeInsets.only(top: 10.w),
                          child: ProgressCard(item: item));
                    },
                        childCount: controller.filteredList.length == 0
                            ? 1
                            : controller.filteredList.length),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
