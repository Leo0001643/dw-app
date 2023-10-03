import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/recharge/recharge_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../app_service.dart';

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
    double timeDouble = DateTime.now().millisecondsSinceEpoch / 1000;
    int newTime = timeDouble.toInt();

    if (uri != null) {
      // 判断下http，80不要传
      // https，443不要传，就是浏览器打开的连接,不需要带端口
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

      ///找出选中的channel 的上层模型的 item的productsTag
      OnlineProduct? selectedProduct;
      currentCategory.item?.forEach((OnlineProduct product) {
        product.item?.forEach((OnlineProductChannel channel) {
          // if (channel.itemId == currentChannel.itemId) {
          //   selectedProduct = product;
          // }
          if (channel.isEqual(currentChannel)) {
            selectedProduct = product;
          }
        });
      });
      final String? tag = selectedProduct?.productsTag;
      print('支付channel.productsTag:${selectedProduct?.productsTag}');

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
        "ishd": "1"
      });
      print('realUri == ${realUri}');
      onSubmitOnlineReady(realUri);
    } else {
      SmartDialog.showToast('解析Uri失败，请联系客服');
    }
  }

  void onSubmitOnlineReady(Uri uri) {
    AppService.to.openUrl(uri.toString());
    // Get.toNamed(Routes.webPage,
    //     arguments: WebData(uri.toString(), currentCategory.classname));
  }

  // void onSubmitOnlineReady(Uri uri) {
  //   Get.toNamed(Routes.webPage, arguments: WebData(uri.toString(), '充值'));
  // }
}
