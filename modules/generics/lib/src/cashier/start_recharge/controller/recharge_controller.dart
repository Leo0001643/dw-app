import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/recharge/recharge_logic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/recharge_online/widget/recharge_vip_dialog.dart';
import 'package:generics/src/cashier/widgets/animations.dart';
import 'package:get/get.dart';

class RechargeController extends RechargeLogic {
  static RechargeController get to => Get.find();

  void onNavigate(BasePayCategory item) {
    // print('itemonNavigate.classimg: ${item.classimg}');
    // print('itemonNavigate.classname: ${item.classname}');
    // print('itemonNavigate.tag: ${item.tag}');

    final payProduct = payCategoryList.firstWhere(
      (element) {
        //只比较tag，会出现匹配错误的情况
        return (element.tag == item.tag && element.classname == item.classname);
      },
    );
    switch (payProduct.runtimeType) {
      case OnlineCategory:
        // 线上充值直接跳转
        Get.toNamed(
          Routes.onlineDep,
          arguments: OnlinePageArgs(
            category: payProduct as OnlineCategory,
            onlineInfo: state.onlineInfo,
          ),
        );
        break;
      case TransferCategory:
        // 转账汇款需要判断是否有多个渠道
        payProduct as TransferCategory;

        //b97测试提出要求，一个也跳转列表
        // if (payProduct.item!.length > 1) {
        if (payProduct.item!.isNotEmpty) {
          Get.toNamed(
            Routes.transferChannel,
            arguments: TransferChannelArgs(
                category: payProduct, rate: state.rate, typeTitle: '转账汇款'),
          );
        } else {
          Get.toNamed(
            Routes.transferDep,
            arguments: TransferPageArgs(
              category: payProduct,
              product: payProduct.item!.first,
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

    //recharge是mainTabBar按钮的时候，每次需要重新刷新recharge
    EventBus.on(EventType.onRechargeReload, (arg) async {
      await getPayxsproduct();
      await deposityh();
    });
  }
}
