import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_logic_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:generics/src/cashier/data/withdraw_theme.dart';
import 'package:generics/src/cashier/widgets/withdraw_scaffold.dart';
import 'package:get/get.dart';

import '../../start_recharge/widget/no_data.dart';
import '../../utils/theme_scaffold.dart';
import '../controllers/card_manager_logic.dart';

class CardManagerViewNew extends StatelessWidget {
  /// 是否隐藏appbar app03 是底部弹窗，隐藏appbar
  final bool? isHideAppbar;
  const CardManagerViewNew({Key? key, this.isHideAppbar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerLogic());
    var controller = Get.put(CardManagerChildLogic());

    _body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Obx(() {
            if (controller.state.banks.isEmpty) {
              return _noData();
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.state.banks.length + 1,
                    itemBuilder: (context, index) {
                      if (controller.state.banks.isNotEmpty &&
                          index == controller.state.banks.length) {
                        return _getBottomViewBySite();
                      } else {
                        return Container(
                          margin: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 12.w)
                              .copyWith(
                            top: index == 0 ? 12.w : 0,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            child: SwipeActionCell(
                              ///这个key是必要的
                              key: ValueKey(index.toString()),
                              trailingActions: <SwipeAction>[
                                SwipeAction(
                                    title: "删除",
                                    onTap: (CompletionHandler handler) async {
                                      await handler(false);
                                      print('isEditable == ${controller.state.isEditable}');
                                      if (!controller.state.isEditable) {
                                        controller.onDeleteCanNot();
                                        return;
                                      }

                                      controller.deleteCard(
                                          controller.state.banks[index]);
                                    },
                                    color: Colors.red),
                              ],
                              child: _siteItem(index),
                            ),
                          ),
                        );
                      }
                    }),
              );
            }
          }),
        ],
      );
    }

    if (isHideAppbar == true) {
      return _body();
    }
    return WithdrawScaffold(
      title: '卡包管理',
      backgroundColor: AoneAppTheme.appTheme.withdrawBgColor,
      body: _body(),
    );
  }

  Widget _siteItem(int index) {
    String siteTag = AppEnv.config.siteTag;
    printInfo(info: "-------> 解决siteTag ${siteTag}  ");
    if (siteTag == "C15") {
      return _buildListItemC01(index);
    } else if ("g87，g85，g86，g83".contains(siteTag)) {
      return _buildListItemG87(index);
    } else {
      return _buildListItem(index);
    }
  }

  Widget _getBottomViewBySite() {
    String siteTag = AppEnv.config.siteTag;
    printInfo(info: "-------> 解决siteTag ${siteTag}  ");
    if (siteTag == "C15") {
      return _getBottomView();
    } else if ("g87，g85，g86，g83".contains(siteTag)) {
      return _getBottomViewG87();
    } else {
      return _getBottomView();
    }
  }

  /**
   * 返回底部的界面
   */
  Widget _getBottomViewG87() {
    return Column(
      children: [
        _addBankView(),
        Container(
          width: Get.width,
          padding: EdgeInsets.only(left: 20.r, top: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '备注:',
                style: TextStyle(
                    color: AoneAppTheme.appTheme.cardManagerNoteColor,
                    fontSize: 12.sp),
              ),
              _getCustomText('可以添加多张卡片，请按需求添加'),
              _getCustomText('点击已添加的卡片，可对卡片信息进行修改;'),
              _getCustomText('左滑已绑定的卡片可以进行删除。'),
            ],
          ),
        )
      ],
    );
  }

  _getCustomText(String s) {
    return Text(
      s,
      style: TextStyle(
          color: AoneAppTheme.appTheme.cardManagerNoteColor, fontSize: 12.sp),
    );
  }

  Widget _noData() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "您尚未绑定卡片",
            style: TextStyle(
                color: WithdrawTheme().cardManagerTextColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        // _addBankView(),
        _getBottomViewBySite()
      ],
    );
  }

  Widget _buildListItemG87(int index) {
    var controller = CardManagerChildLogic.to;
    var state = CardManagerLogic.to.state;
    var data = controller.state.banks[index];
    return GestureDetector(
      onTap: () {
        controller.state.selIndex = index;
        Get.toNamed(Routes.bankEdit);
      },
      child: Container(
        width: Get.width,
        height: 100.r,
        margin: EdgeInsets.only(
          top: index == 0 ? 10.r : 0,
          bottom: 10.r,
          left: 10.r,
          right: 10.r,
        ),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: WithdrawTheme().cardBgGradient,
          image: const DecorationImage(
              alignment: Alignment.centerRight,
              image:
                  AssetImage('assets/images/blanknew.png', package: 'generics'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 10.r,
              ),
              child: Text(
                data.bankname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.bankcard,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
                /*  以前设计图有，后来去掉，先保留以后后来更改
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0x88000000),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(
                    bottom: 5.r,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "修改卡片信息",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      Image.asset(
                        'assets/images/editor.png',
                        package: 'generics',
                        width: 20,
                        height: 20,
                      )
                      // Icon(Icons.edit,color: Color(0xFFffffff),)
                    ],
                  ),
                ),
                */
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItemC01(int index) {
    var controller = CardManagerChildLogic.to;
    var state = CardManagerLogic.to.state;
    var data = controller.state.banks[index];
    WithdrawTheme _theme = WithdrawTheme();
    return GestureDetector(
      onTap: () {
        controller.state.selIndex = index;
        Get.toNamed(Routes.bankEdit);
      },
      child: Container(
        width: Get.width,
        height: 120.r,
        margin: EdgeInsets.only(
          top: index == 0 ? 10.r : 0,
          bottom: 10.r,
          left: 10.r,
          right: 10.r,
        ),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_theme.bankCardBgImage ??
                  'assets/images/user/card_manager_bankcardground.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 5.r,
              ),
              child: Text(
                data.bankname,
                style: TextStyle(
                  color: AoneAppTheme.appTheme.bankCardTextColor ??
                      const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.sp,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20.r,
              ),
              child: Text(
                data.bankkaihu,
                style: TextStyle(
                  color: AoneAppTheme.appTheme.bankCardTextColor ?? const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 14.sp,
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              data.bankcard,
              style: TextStyle(
                color: AoneAppTheme.appTheme.bankCardTextColor ?? const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 14.sp,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    var controller = CardManagerChildLogic.to;
    var state = CardManagerLogic.to.state;
    var data = controller.state.banks[index];
    WithdrawTheme _theme = WithdrawTheme();
    return GestureDetector(
      onTap: () {
        controller.state.selIndex = index;
        Get.toNamed(Routes.bankEdit);
      },
      child: Container(
        height: 108.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_theme.bankCardBgImage ??
                'assets/images/user/h09_card_manager_bankcardground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.bankname,
              style: TextStyle(
                color: AoneAppTheme.appTheme.bankCardTextColor ?? Colors.white,
                fontSize: 14.sp,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20.w,
            ),
            Text(
              data.bankcard,
              style: TextStyle(
                color:AoneAppTheme.appTheme.bankCardTextColor ?? Colors.white,
                fontSize: 14.sp,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _addBankView() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.w)
          .copyWith(top: 2),
      height: 100.w,
      decoration: AoneAppTheme.appTheme.addButtonDecoration,
      child: GestureDetector(
        onTap: () {
          debugPrint('点击了添加银行卡');

          // Get.toNamed(appRoutes.Routes.login);
          Get.toNamed(Routes.bankBind);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: AoneAppTheme.appTheme.addButtonTextColor,
            ),
            const SizedBox(width: 5),
            Text(
              "添加",
              style: TextStyle(
                  color: AoneAppTheme.appTheme.addButtonTextColor, fontSize: 18.w),
            )
          ],
        ),
        // child: Chip(
        //   padding:
        //       EdgeInsets.only(top: 10.r, left: 80.r, bottom: 10.r, right: 80.r),
        //   backgroundColor: WithdrawTheme().primary,
        //   label: Text(
        //     '添加银行卡',
        //     style: TextStyle(color: Colors.white, fontSize: 16.sp),
        //   ),
        //   avatar: Image.asset('assets/images/user/user_bank_add.png'),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        // ),
      ),
    );
  }

  /**
   * 返回底部的界面
   */
  Widget _getBottomView() {
    WithdrawTheme _theme = WithdrawTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _addBankView(),
        if (WithdrawTheme().hideBottomTips != true)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              _theme.remarks ?? '备注:\n可以添加多张卡片，请按需求添加;\n点击已添加的卡片，可对卡片信息进行修改;\n左滑已绑定的卡片可以进行删除信息',
              style: TextStyle(
                color: AoneAppTheme.appTheme.cardManagerNoteColor,
                fontSize: 12.w,
                fontWeight: FontWeight.w500,
                height: 18 / 12,
              ),
            ),
          ),
      ],
    );
  }
}
