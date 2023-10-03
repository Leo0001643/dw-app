
import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../theme/theme_scaffold.dart';
import 'controllers/promotion_rebate_controller.dart';

class PromotionRebateView extends GetView<PromotionRebateController> {
  var textStyle = TextStyle(color: stringToColor('1f1f1f'), fontSize: 12);
  var titleStyle = TextStyle(
      color: stringToColor('666666'),
      fontSize: 13,
      fontWeight: FontWeight.bold);

  PromotionRebateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionRebateController>(builder: (_) {
      return ThemeScaffold(
          actions: _titleBtnViews(),
          title: '推广返利',
          body: Container(
            color: const Color(0xFFFBFAF9),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      width: Get.width,
                      height: 288.r,
                      child: Stack(
                        children: [
                          Positioned(child: _buildHeaderView()),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: -15.r,
                              child: _buildFootView())
                        ],
                      ),
                    ),
                    _buildButtonList(),
                    _buildContent(),
                  ],
                )),
              ],
            ),
          ));
    });
  }

  List<Widget> _titleBtnViews() {
    List<Widget> _list = [];

    _list.add(InkWell(
        onTap: () {
          Get.toNamed(Routes.commissionDes);
        },
        child: Container(
          padding: EdgeInsets.only(right: 15.r),
          child: Row(
            children: [ Text('佣金说明')],
          ),
        )));
    return _list;
  }

  _buildHeaderView() {
    return Container(
      height: 230.h,
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      decoration: BoxDecoration(
        color: AppTheme.promotionHeaderBgColor,

              ),
      child: Obx(() {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _itemHeader(
                    '总佣金',
                    controller.state.quanmintgUserYjInfo.items?.totalYj
                            .toString() ??
                        ''),
                Image.asset('assets/images/user/person_line.png'),
                _itemHeader(
                    '昨日佣金',
                    controller.state.quanmintgUserYjInfo.items?.yesterdayYj
                            .toString() ??
                        ''),
                Image.asset('assets/images/user/person_line.png'),
                _itemHeader(
                    '可领取佣金',
                    controller.state.quanmintgUserYjInfo.items?.okGetYj
                            .toString() ??
                        ''),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  YongJinDto dto = YongJinDto();
                  dto.total = controller
                      .state.quanmintgUserYjInfo.items!.okGetYj!
                      .toString();
                  controller.getYongJin(dto);
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 14),
                    alignment: const Alignment(0, 0),
                    height: 36,
                    width: 112,
                    decoration: const BoxDecoration(
                      color: Color(0x80F8F1F1),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Text(
                      '领取佣金',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ))),
          ],
        );
      }),
    );
  }

  _itemHeader(String title, String money) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: stringToColor('FFFFFF'),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${money == "" ? "0" : money}元',
          style: TextStyle(color: stringToColor('FFFFFF'), fontSize: 14),
        ),
      ],
    );
  }

  _buildButtonList() {
    return Obx(() => Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: 268,
            height: 36,
            decoration: BoxDecoration(
                color: const Color(0x4D000000),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 30,
                  )
                ]),
            child: Row(
              children: <Widget>[
                _itemButton('推广信息', controller.isSelect.value, 0),
                _itemButton('历史业绩', !controller.isSelect.value, 1),
              ],
            ),
          ),
        ));
  }

  _itemButton(String title, bool selState, int index) {
    return Container(
      height: 36,
      width: 134,
      decoration: BoxDecoration(
        color: selState ? stringToColor('FFFFFF') : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () {
          controller.changeItem(index);
          print('点击了头部按钮');
        },
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: Text(
          title,
          style: TextStyle(
              color:
                  selState ? stringToColor('000000') : stringToColor('666666'),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  _buildContent() {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.themeBackgroundColor,
        ),
        child: controller.isSelect.value == true
            ? _buildContentList()
            : _buildHistorcalContentList(),
        // child: controller.isSelect.value == true
        //     ? _buildContentList()
        //     : _buildContentList(),
        // child: controller.isSelect.value == true ? Text('xxxx') : Text('xxxx'),
      );
    });
  }

  _buildContentList() {
    return Obx(() {
      QuanmintgUserYjInfo quanmintgUserYjInfo =
          controller.state.quanmintgUserYjInfo;
      QuanmintgUserYjInfoItems items =
          quanmintgUserYjInfo.items ?? QuanmintgUserYjInfoItems();
      return Column(
        children: <Widget>[
          _titleItem(),
          _item('总人数', items.oneCount.toString(), items.twoCount.toString(),
              items.threeCount.toString(), false),
          Container(
            height: 1,
            width: double.infinity,
            color: AppTheme.undeer_line_color,
          ),
          _item(
              '历史业绩/元',
              items.oneBetTotal.toString(),
              items.twoBetTotal.toString(),
              items.threeBetTotal.toString(),
              false),
          Container(
            height: 1,
            width: double.infinity,
            color: AppTheme.undeer_line_color,
          ),
          _item(
              '今日新增人数/人',
              items.oneNewUser.toString(),
              items.twoNewUser.toString(),
              items.threeNewUser.toString(),
              false),
          Container(
            height: 1,
            width: double.infinity,
            color: AppTheme.undeer_line_color,
          ),
          _item(
              '今日团队业绩/元/人',
              items.oneBetTotalDay.toString(),
              items.twoBetTotalDay.toString(),
              items.threeBetTotalDay.toString(),
              false),
        ],
      );
    });
  }

  _buildHistorcalContentList() {
    int count = controller.state.quanmintgYiOrderList.count ?? 0;
    if (count <= 0) {
      return Container(
        color: AppTheme.normalBgColor,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 51.r),
        child: Text(
          " 暂无历史业绩",
          style: TextStyle(color: AppTheme.normalTextColor, fontSize: 14.sp),
        ),
      );
    }
    List<Widget> _itemList = [];
    if ((controller.state.quanmintgYiOrderList.count ?? 0) > 0) {
      for (int i = 0;
          i < controller.state.quanmintgYiOrderList.items!.length;
          i++) {
        QuanmintgYiOrderListItems items =
            controller.state.quanmintgYiOrderList.items![i];
        _itemList.add(_item(items.riqi!, items.yijiYeji!, items.erjiYeji!,
            items.sanjiYeji!, false));
      }
    }

    return Obx(() {
      return Column(
        children: <Widget>[
          _titleItem(),
          Obx(() {
            if (controller.state.quanmintgYiOrderList.items?.isNotEmpty ??
                false) {
              return ListView(
                children: _itemList,
                shrinkWrap: true,
              );
            } else {
              return Expanded(
                  child: Center(
                child: Text(
                  'historical.no.data2'.tr,
                  style: TextStyle(
                      color: stringToColor('0b213b', 0.8), fontSize: 15),
                ),
              ));
            }
          })
        ],
      );
    });
  }

  _titleItem() {
    return Container(
        height: 40,
        color: AppTheme.themeBackgroundColor,
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(color: Colors.red),
              alignment: Alignment.center,

              width: 105,
              child: Text(
                controller.isSelect.value == false
                    ? controller.titleList[0]
                    : '',
                style: titleStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 75,
              child: Text(
                controller.titleList[1],
                style: titleStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 75,
              child: Text(
                controller.titleList[2],
                style: titleStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 75,
              child: Text(
                controller.titleList[3],
                style: titleStyle,
              ),
            ),
          ],
        ));
  }

  _item(String title, String frist, String second, String third, bool isTitle) {
    return Container(
      height: 41,
      decoration: BoxDecoration(color: AppTheme.normalBgColor
          // color: Colors.red
          ),
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 115,
            child: Text(
              title,
              style: textStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 75,
            child: Text(
              frist,
              style: textStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 75,
            child: Text(
              second,
              style: textStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 75,
            child: Text(
              third,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }

  _buildFootView() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 13.r),
      padding: const EdgeInsets.only(top: 15, left: 9, bottom: 15, right: 9),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          _buildShare(),
          Row(
            children: [
              Obx(
                () {
                  return Container(
                    width: 229.w,
                    height: 30.h,
                    margin: const EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(248, 241, 241, 0.5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: const Color(0xFFEBEBEB))),
                    child: Text(
                      controller.state.quanmintgUserYjInfo.items?.tjUrl ?? '',
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFFCCCCCC)),
                    ),
                  );
                },
              ),
              _footButton(),
            ],
          )
        ],
      ),
    );
  }

  _buildShare() {
    List<Widget> _shareList = [];
    for (int i = 0; i < controller.shareList.length; i++) {
      Tuple2 tuple2 = controller.shareList[i];
      _shareList.add(_shareItem(tuple2, i));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _shareList,
    );
  }

  Widget _shareItem(Tuple2 tuple2, int index) {
    return GestureDetector(
      onTap: () {
        controller.onTapShareList(index);
      },
      child: Column(
        children: <Widget>[
          Image.asset(tuple2.item1),
          Text(
            tuple2.item2,
            style: TextStyle(color: stringToColor('8c8c8c'), fontSize: 10),
          )
        ],
      ),
    );
  }

  _footButton() {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        width: 90.w,
        height: 30.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            gradient: AppTheme.primaryGradient),
        child: GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(
                text: controller.state.quanmintgUserYjInfo.items!.tjUrl!));
            SmartDialog.showToast('user.center.success.copy'.tr);
            print('点击了分享链接');
          },
          child: const Text(
            '分享链接',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
