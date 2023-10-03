import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/strong_activity_controller.dart';

class StrongActivityAppBar extends StatelessWidget with PreferredSizeWidget {
  const StrongActivityAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: AoneAppTheme.appTheme.strongAppBarDecoration ??
            AoneAppTheme.appTheme.gameAppBarDecoration,
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image(
          width: 25,
          height: 25,
          color: AoneAppTheme.appTheme.strongAppBarIconColor,
          image: const AssetImage(
            'assets/images/home/person_back.png',
          ),
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
            color: AoneAppTheme.appTheme.strongAppBarIconColor,
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
                        ?  (AoneAppTheme.appTheme.strongAppBarCheckIconColor??AoneAppTheme.appTheme.strongAppBarIconColor)
                        : AoneAppTheme.appTheme.strongDisabledColor,
                    fontWeight: FontWeight.w500),
              ),
              isSelected
                  ? Container(
                      margin: EdgeInsets.only(top: 15.r),
                      width: 62.r,
                      height: 4.r,
                      color: (AoneAppTheme.appTheme.strongAppBarCheckIconColor??AoneAppTheme.appTheme.strongAppBarIconColor),
                    )
                  : SizedBox(
                      height: 19.r,
                    )
            ],
          ));
    });
  }
}
