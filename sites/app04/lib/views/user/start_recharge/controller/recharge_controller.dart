import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:app04/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'package:aone_common/controllers/recharge/recharge_logic.dart';

import '../widget/recharge_vip_dialog.dart';

class RechargeController extends RechargeLogic {
  static RechargeController get to => Get.find();

  final RxList<NoticeItems> _noticeItems = RxList.empty();

  RxList<NoticeItems> get noticeItems => _noticeItems;

  set noticeItems(RxList<NoticeItems> value) => _noticeItems.value = value;

  final RxList<NoticeItems> _noticeItemsFilter = RxList.empty();

  RxList<NoticeItems> get noticeItemsFilter => _noticeItemsFilter;

  set noticeItemsFilter(RxList<NoticeItems> value) =>
      _noticeItemsFilter.value = value;

  MessageCenterProvider messageCenterProvider = MessageCenterProvider();

  @override
  Future<void> onInit() async {
    startLoading();
    await super.onInit();
    stopLoading();
  }

  void onNavigate(BasePayCategory item) {
    printInfo(
        info:
            "jett----->  BasePayCategory   item.tag ${item.tag} payCategoryList ${payCategoryList.length}    item is VipPayProduct  ${item is VipPayProduct}");
    int index = 0;

    for (int i = 0; i < payCategoryList.length; i++) {
      BasePayCategory element = payCategoryList[i];
      printInfo(
          info:
              "jett----->  BasePayCategory  i  ${i}    item.runtimeType  ${element.runtimeType}");
      // if (element is VipPayProduct && item is VipPayProduct) {
      //   VipPayProduct vipPayProduct = element;
      //   VipPayProduct itemVipPayProduct = item;
      if (element.classimg == item.classimg) {
        index = i;
        break;
      }
      // }
    }

    // final payProduct = payCategoryList[index];
    // printInfo(
    //     info:
    //         "jett----->  index ${index}  payProduct.runtimeType  ${payProduct.runtimeType}  payProduct  index  ${index} item.tag ${payProduct.tag} item.classname ${payProduct.classname} ");

    switch (item.runtimeType) {
      case OnlineCategory:
        // 线上充值直接跳转
        Get.toNamed(
          Routes.onlineDep,
          arguments: OnlinePageArgs(
            category: item as OnlineCategory,
            onlineInfo: state.onlineInfo,
          ),
        );
        break;
      case TransferCategory:

        // 转账汇款需要判断是否有多个渠道
        item as TransferCategory;
        if (item.item!.length > 1) {
          Get.toNamed(
            Routes.transferChannel,
            arguments: TransferChannelArgs(
              category: item,
              rate: state.rate,
            ),
          );
        } else {
          Get.toNamed(
            Routes.transferDep,
            arguments: TransferPageArgs(
              category: item,
              product: item.item!.first,
              rate: state.rate,
            ),
          );
        }
        break;
      case VipPayProduct:
        item as VipPayProduct;
        if (item.enable == 3) {
          if (GetUtils.isURL(item.href!)) {
            Get.toNamed(Routes.webPage,
                arguments: WebData(item.href!, item.classname));
          } else {
            SmartDialog.showToast('该渠道不可用，请联系在线客服');
          }
          return;
        }
        scaleAndFadeDialog(
          child: RechargeVipDialog(
            product: item,
          ),
          tag: 'vipDialog',
        );
        break;
    }
  }

  void clickHelp(int tag) {
    Get.toNamed(Routes.rechargeTutorial, arguments: tag);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    PopupService.to.triggerPopup(routeName: Routes.recharge);
  }
}
