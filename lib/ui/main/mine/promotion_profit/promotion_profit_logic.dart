import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'promotion_profit_state.dart';

class PromotionProfitLogic extends GetxController {
  final PromotionProfitState state = PromotionProfitState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {

    //http://soptj9qq.com/#/register?sp=100001547
    //100001547
    var user = AppData.user();

    state.userCode.value = "${user?.id ?? 0}";

    state.userLink.value = "${Constants.web_gjz}/#/register?sp=${AppData.user()?.id ?? 0}";

    var painter = QrPainter(data: state.userLink.value, version: QrVersions.auto, gapless: true,
      errorCorrectionLevel: QrErrorCorrectLevel.L);
    painter.toImageData(125.r).then((value) {
      var uint8list = value!.buffer.asUint8List();
      DataUtils.addWhiteBackgroundToImage(uint8list, 150.r, 150.r).then((value){
        state.qrLinkData.value = value;
      });
    });

    var params = {"oid":user?.oid,"username":user?.username,"pageSize":Constants.pageSize,"page":1};

    HttpService.getSpreadPromos(params).then((value) {
      state.spreadPromos.assignAll(value.list ?? []);
      clickTab(0);///默认显示推广红利的数据
    });


    HttpService.getSpreadUser(params).then((value) {
      state.spreadUser.assignAll(value);
    });

  }

  void clickTab(int index) {

    switch(index){
      case 0:
        state.showList.assignAll(state.spreadPromos);
        state.showList.refresh();
        break;
      case 1:
        state.showList.assignAll(state.spreadUser);
        state.showList.refresh();
        break;
    }
  }

  void saveQrLink() async {
    if(state.qrLinkData.value.isEmpty){ return; }

    var result = await ImageGallerySaver.saveImage(state.qrLinkData.value);
    loggerArray(["文件保存目录存在",result]);
    ///{filePath: content://media/external/images/media/1000000036, errorMessage: null, isSuccess: true}
    if(unEmpty(result) && result is Map && result["isSuccess"] == true){
      showToast(Intr().baocunchenggong);
    }
  }




}
