import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/views/games/controllers/strong_activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StrongActivityAppBar extends StatelessWidget with PreferredSizeWidget {
  const StrongActivityAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        color: AppTheme.primaryBg,
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(
          "assets/images/user/back.png",
          width: 30,
          height: 30,
        ),
      ),
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      title: _navView(),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.gameSearch);
          },
          child: Image.asset(
            'assets/images/home/search.png',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;

  Widget _navView() {
    return Container(
      width: double.infinity,
      height: 54.r,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24.r,
          ),
          _activityTabItem(0),
          SizedBox(
            width: 24.r,
          ),
          _activityTabItem(1),
        ],
      ),
    );
  }

  Widget _activityTabItem(index) {
    String title = ['本站推荐', '强档活动'][index];
    final controller = StrongActivityController.to;

    return Obx(() {
      bool isSelected = controller.activeTabIndex == index;
      return GestureDetector(
          onTap: () {
            controller.activeTabIndex = index;
            controller.activityPageController.jumpToPage(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: isSelected
                        ? AppTheme.activityHighlightTextColor
                        : AppTheme.activityMainTextColor,
                    fontWeight: FontWeight.w500),
              ),
              isSelected
                  ? Container(
                      margin: EdgeInsets.only(top: 15.r),
                      width: 82.r,
                      height: 2.r,
                      color: AppTheme.activityHighlightTextColor,
                    )
                  : SizedBox(
                      height: 17.r,
                    )
            ],
          ));
    });
  }
}
