import 'package:aone_common/common.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/activities/controllers/activity_center_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/dialog/invalid_activity_popup.dart';
import '../controllers/activity_center_controller.dart';
import '../controllers/preferential_controller.dart';

class ActivityCenterView extends GetView<ActivityCenterController> {
  const ActivityCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WelfareCenterLogic());
    Get.lazyPut(() => PreferentialController());

    return GetBuilder<ActivityCenterController>(
      builder: (_) {
        return ThemeScaffold(
          title: '优惠中心',
          backgroundColor: stringToColor("1E1E1E"),
          body: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: context.mediaQueryViewPadding.bottom + 25.r,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildHeaderContent(context),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildListView(),
                ],
              )),
          // bottomNavigationBar: getBottomNavigationBar(context),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   backgroundColor: Colors.white,
          //   child: getFloatingButton(),
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Container(
      child: Stack(children: [
        Padding(
            padding: EdgeInsets.all(15.r),
            child: Image.asset(
              'assets/images/promocenter/bg.png',
              fit: BoxFit.contain,
            )),
        Positioned(
          left: 30.r,
          right: 45.r,
          bottom: 40.r,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Obx(() => _itemHeaderContent(
                    '返水记录',
                    () => Get.toNamed(Routes.rebateRecord, arguments: true),
                    '返水金额：',
                    true,
                    WelfareCenterLogic.to.state.rebateAmount,
                  )),
              Obx(
                () => _itemHeaderContent(
                    '未领优惠',
                    () => Get.toNamed(Routes.myPreferential),
                    '优惠金额：',
                    false,
                    PreferentialController.to.state.activityAmount),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  // DecorationImage _buttonBg(double amount) {
  //   var buttonBg = 'assets/images/user/activity_center_hbutground.png';
  //   if (amount > 0.0) {
  //     return DecorationImage(
  //       filterQuality: FilterQuality.medium,
  //       image: AssetImage(
  //         buttonBg,
  //       ),
  //       fit: BoxFit.fill,
  //     );
  //   }
  //   return DecorationImage(
  //     filterQuality: FilterQuality.medium,
  //     colorFilter: const ColorFilter.matrix(<double>[
  //       0.2126,
  //       0.7152,
  //       0.0722,
  //       0,
  //       0,
  //       0.2126,
  //       0.7152,
  //       0.0722,
  //       0,
  //       0,
  //       0.2126,
  //       0.7152,
  //       0.0722,
  //       0,
  //       0,
  //       0,
  //       0,
  //       0,
  //       1,
  //       0,
  //     ]),
  //     image: AssetImage(
  //       buttonBg,
  //     ),
  //     fit: BoxFit.fill,
  //   );
  // }

  Widget _itemHeaderContent(
    String recordType,
    Function() historyPress,
    String moneyTitle,
    bool left,
    double amount,
  ) {
    // final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;

    return Container(
      height: 35.r,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.r),
            child: Row(children: [
              Image.asset(
                "assets/images/promocenter/dollar.png",
                width: 20.r,
                height: 20.r,
              ),
              SizedBox(
                width: 6.r,
              ),
              Container(
                width: 110.r,
                child: AutoSizeText(
                  moneyTitle + amount.toString() + '元',
                  style:
                      const TextStyle(fontSize: 12, color: AppTheme.onPrimary),
                  maxLines: 1,
                  minFontSize: 9,
                ),
              ),
              // Text(
              //   // moneyTitle + amount.toString() + '元',
              //   moneyTitle + '1233333.3' + '元',
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(
              //     fontSize: 12.sp,
              //     color: AppTheme.onPrimary,
              //   ),
              // ),
              // )
            ]),
          ),
          Row(
            children: [
              Container(
                width: 68.r,
                height: 22.r,
                alignment: Alignment.center,
                decoration: amount > 0
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(4.5),
                        boxShadow: const [AppTheme.promoBtnOnBoxShadow],
                        gradient: AppTheme.promoBtnOnGradient)
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(4.5),
                        boxShadow: const [AppTheme.promoBtnOffBoxShadow],
                        gradient: AppTheme.promoBtnOffGradient),
                child: GestureDetector(
                  onTap: () {
                    if (left) {
                      debugPrint('点击了返水领取');
                      controller.collectRebate();
                    } else {
                      debugPrint('点击了优惠领取');
                      controller.collectReward();
                    }
                  },
                  child: const Text(
                    '一键领取',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.r,
              ),
              GestureDetector(
                onTap: historyPress,
                child: Center(
                  child: Text(
                    '查看' + recordType,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            ActivityCenterModel model = controller.dataList[index];
            var isContain = model.title.contains("敬请期待");
            if (isContain == true) {
              Get.dialog(const InvalidActivityPopup());
              return;
            } else {
              controller.clickItem(index);
            }
          },
          child: _item(
            controller.dataList[index],
          ),
        ),
        itemCount: controller.dataList.length,
      ),
    );
  }

  Widget _item(ActivityCenterModel centerModel) {
    var isContain = centerModel.title.contains("敬请期待");
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/user/${centerModel.imagName}',
            fit: BoxFit.fill,
            width: 80.r,
            height: 80.r,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10.r, top: 5.r, left: 10.r),
                  padding: EdgeInsets.symmetric(vertical: 5.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/promocenter/${isContain ? 'button_bg_off.png' : 'button_bg.png'}'),
                    ),
                    // borderRadius: BorderRadius.circular(5.r),
                    // color: isContain
                    //     ? AppTheme.color484848
                    //     : AppTheme.color987652
                  ),
                  child: Text(
                    centerModel.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          // const Spacer(),
          // ThemeButton(
          //   height: 28.r,
          //   width: 78.r,
          //   radius: 10,
          //   onTap: callback,
          //   text: '进入',
          // ),
        ],
      ),
    );
  }
}
