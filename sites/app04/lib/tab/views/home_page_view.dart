import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/general/controllers/home_page_controller.dart';
import 'package:app04/views/general/controllers/home_state.dart';
import 'package:app04/views/general/widget/home_app_bar.dart';
import 'package:app04/views/general/widget/home_carousel.dart';

import 'package:app04/views/general/widget/home_notice_widget.dart';
import 'package:app04/views/general/widget/home_tool_widget.dart';
import 'package:app04/views/home/home_list_widget.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';
import 'dart:ui' as UI;

import '../../theme/color_schema.dart';
import '../../views/general/widget/advertLayout.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => HomePageController());
    HomeState state = HomePageController.to.state;
    int index = 0;

    return ThemeScaffold(
      appBar: const HomeAppBar(),
      body: RedThumbnailWrapper(
        cancelIconColor: AppTheme.danger,
        child: AdvertLayout(
          child: Column(
            children: [
              const HomeCarousel(),
              const HomeNoticeWidget(),
              const HomeToolWidget(),
              Container(
                color: const Color(0xFFFBFAF9),
                child: Obx(() {
                  return TabBar(
                      isScrollable: true,
                      automaticIndicatorColorAdjustment: true,
                      labelColor: const Color(0xFFF0BE5C),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: const TextStyle(
                          color: Color(0xFFF0BE5C),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      unselectedLabelColor: const Color(0xFF666666),
                      unselectedLabelStyle: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(
                              width: 1, color: const Color(0xFFFBFAF9))),
                      controller: state.tabController,
                      tabs: HomePageController.to.navConfigList
                          .mapIndexed((e, index) {
                        return Container(
                          width: 75.w,
                          height: 55.w,
                          decoration: BoxDecoration(
                            color: HomePageController.to.selectIndex == index
                                ? const Color(0xffCCCCCC)
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            margin: HomePageController.to.selectIndex == index
                                ? EdgeInsets.only(
                                    left: 1.w, right: 1.w, top: 1.w)
                                : null,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            child: Tab(
                                text: e.nameCn,
                                icon: DjImage.asset(
                                  e.image!,
                                  width: 75,
                                  height: 22,
                                ),
                                iconMargin: const EdgeInsets.all(5)),
                          ),
                        );
                      }).toList());
                }),
              ),
              Expanded(
                child: TabBarView(
                    controller: state.tabController,
                    children: HomePageController.to.navConfigList.map((e) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 0),
                        child: HomeListWidget(index++),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
