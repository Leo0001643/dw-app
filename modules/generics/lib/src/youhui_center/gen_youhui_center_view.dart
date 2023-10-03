import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../cashier/utils/theme_scaffold.dart';
import 'gen_youhui_center_controller.dart';

class GenYouhuiCenterView extends GetView<GenYouhuiCenterController> {
  const GenYouhuiCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WelfareCenterLogic());

    return GetBuilder<GenYouhuiCenterController>(
      builder: (_) {
        return ThemeScaffold(
          title: '优惠中心',
          backgroundColor: AoneAppTheme.appTheme.yhcBgColor!,
          body: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: context.mediaQueryViewPadding.bottom + 25.r,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildHeaderContent(context),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildListView(),
                ],
              )),
        );
      },
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/promocenter/yh_center_bg.png',
        fit: BoxFit.fitWidth,
      ),
      Image.asset(
        'assets/images/promocenter/yh_center_caishen.png',
        fit: BoxFit.fitWidth,
      ),
      Positioned(
        left: 15.5.r,
        top: 33.r,
        child: Image.asset(
          'assets/images/promocenter/yh_center_text.png',
          width: 171.5.r,
          height: 63.5,
        ),
      ),
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
                  '返水金额:',
                  true,
                  WelfareCenterLogic.to.state.rebateAmount,
                )),
            Obx(
              () => _itemHeaderContent(
                  '未领优惠',
                  () => Get.toNamed(Routes.myPreferential),
                  '优惠金额:',
                  false,
                  WelfareCenterLogic.to.state.activityAmount),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _itemHeaderContent(
    String recordType,
    Function() historyPress,
    String moneyTitle,
    bool left,
    double amount,
  ) {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;

    return Container(
      height: 35.r,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.r),
            child: Row(children: [
              Image.asset(
                "assets/images/promocenter/dollar.png",
                width: 15.r,
                height: 15.r,
                color: AoneAppTheme.appTheme.yhcMoneyColor,
              ),
              SizedBox(
                width: 6.r,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 112.r),
                child: Text(
                  moneyTitle + ' ' + amount.toString() + '元',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AoneAppTheme.appTheme.yhcMoneyColor,
                  ),
                ),
              )
            ]),
          ),
          Row(
            children: [
              Container(
                width: 74.r,
                height: 26.r,
                alignment: Alignment.center,
                decoration: amount > 0
                    ? AoneAppTheme.appTheme.yhcBtnBgDecoration
                    : AoneAppTheme.appTheme.yhcBtnDisableBgDecoration,
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
                      fontSize: 12,
                      color: AoneAppTheme.appTheme.yhcMoneyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
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
            // if(){}
            ActivityCenterModel model = controller.dataList[index];
            var isContain = model.title.contains("敬请期待");
            if (isContain == true) {
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
                  margin: EdgeInsets.only(top: 5.r),
                  height: 22.r,
                  width: 68.r,
                  alignment: Alignment.center,
                  decoration: isContain
                      ? AoneAppTheme.appTheme.yhcBtnDisableBgDecoration
                      : AoneAppTheme.appTheme.yhcBtnBgDecoration,
                  child: Text(
                    centerModel.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
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
