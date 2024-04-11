import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'rebate_detail_state.dart';

class RebateDetailLogic extends GetxController {
  final RebateDetailState state = RebateDetailState();

  @override
  void onReady() {
    backWaterDetail();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void backWaterDetail() {

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username};
    ///游戏类型【1:PC28,2:DS】
    params["gameType"] = state.params.details?.gameType?.toUpperCase() == Constants.PC28 ? 1:2;
    params["date"] = state.params.record?.date;
    params["id"] = state.params.record?.id;
    HttpService.backWaterDetail(params).then((value) {
      state.data.assignAll(value);
      state.data.refresh();
    });

  }






}
