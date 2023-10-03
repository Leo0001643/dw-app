import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/recharge/recharge_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../generics.dart';

class RechargeOnlineController extends GetxController {
  late OnlineCategory currentCategory;
  late OnlineInfo onlineInfo;

  TextEditingController textEditingController = TextEditingController();

  final RxString _amount = ''.obs;
  String get amount => _amount.value;
  set amount(String val) => {_amount.value = val};

  final RxInt _activeChannelIndex = 0.obs;
  int get activeChannelIndex => _activeChannelIndex.value;
  set activeChannelIndex(int val) => _activeChannelIndex.value = val;

  OnlineProductChannel get currentChannel => channelList[activeChannelIndex];

  List<OnlineProductChannel> get channelList =>
      currentCategory.item!.fold<List<OnlineProductChannel>>(
        [],
        (prev, e) {
          return prev..addAll(e.item!);
        },
      ).toList();

  final RxInt _promotionIndex = 0.obs;
  int get promotionIndex => _promotionIndex.value;
  set promotionIndex(int index) => _promotionIndex.value = index;

  final RxBool _isPromotionShow = false.obs;
  bool get isPromotionShow => _isPromotionShow.value;
  set isPromotionShow(bool show) => _isPromotionShow.value = show;

  @override
  void onInit() {
    OnlinePageArgs args = Get.arguments as OnlinePageArgs;

    currentCategory = args.category;
    onlineInfo = args.onlineInfo;
    super.onInit();
  }

  void onBeforeSubmit() {
    if (amount == '') {
      SmartDialog.showToast('充值金额不能为空');
      return;
    }

    var itemId = currentChannel.itemId;
    printInfo(info: "jett ------->url " + currentChannel.url!);
    Uri? uri = Uri.tryParse(
      currentChannel.url!,
    );
    if (uri != null) {
      var onlineRate = RechargeController.to.state.onlineRate * 100;
      int newTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      ///找出选中的channel 的上层模型的 item的productsTag
      OnlineProduct? selectedProduct;
      currentCategory.item?.forEach((OnlineProduct product) {
        product.item?.forEach((OnlineProductChannel channel) {
          if (channel.isEqual(currentChannel)) {
            selectedProduct = product;
          }
        });
      });
      final String? tag = selectedProduct?.productsTag;
      print('支付channel.productsTag:${selectedProduct?.productsTag}');

      int? port = uri.port;
      if (uri.scheme.contains('https')) {
        if (port == 443) {
          port = null;
        }
      } else {
        if (port == 80) {
          port = null;
        }
      }
      printInfo(info: 'uri.scheme:${uri.scheme}');
      printInfo(info: 'port:$port');
      Uri realUri =
          Uri(scheme: uri.scheme, host: uri.host, port: port, queryParameters: {
        "url": Fetch.dio.options.baseUrl,
        "username": onlineInfo.username,
        "sign": onlineInfo.sign,
        "time": onlineInfo.time.toString(),
        'new_time': newTime.toString(),
        'site': onlineInfo.site,
        'tag': tag ?? '',
        "money": amount,
        "itemid": itemId.toString(),
        "ishd": (promotionIndex == 0 && onlineRate > 0) ? "1" : "2"
      });
      print('realUri == ${realUri}');
      onSubmitOnlineReady(realUri);
    } else {
      SmartDialog.showToast('解析Uri失败，请联系客服');
    }
  }

  // https://pay.a1ops01.com/?url=https%3A%2F%2Fpre-qt.a1pre10.com%2F&username=xiu001&sign=385c52139d546c61a701ec2479789273&time=1674653663&new_time=1674653875&site=a02&tag=ylsm&money=10&itemid=3900130&ishd=2
  void onSubmitOnlineReady(Uri uri) {
    // Get.toNamed(Routes.webPage,
    //     arguments: WebData(uri.toString(), currentCategory.classname));
    if (!Get.isRegistered<AppBaseService>()) {
      Get.put(AppBaseService());
    }
    AppBaseService.to.openUrl(uri.toString());
  }

  // void onSubmitOnlineReady(Uri uri) {
  //   Get.toNamed(Routes.webPage, arguments: WebData(uri.toString(), '充值'));
  // }
}
