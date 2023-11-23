import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_record_state.dart';

class RechargeRecordLogic extends GetxController {
  final RechargeRecordState state = RechargeRecordState();

  @override
  void onReady() {
    loadData();
    loadDepositType();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadDepositType() {
    var user = AppData.user()!;
    HttpService.queryDepositType({"oid":user.oid,"username":user.username}).then((value) {
      state.filterWays.assignAll([PaymentListBanks(bankName: Intr().quanbufangshi)]);
      state.filterWays.addAll(value);
    });
  }

  void loadData(){
    var user = AppData.user()!;
    var params = <String,dynamic>{"oid":user.oid,"username":user.username};
    if(unEmpty(state.selectWay.value.bankCode)){
      params["bankCode"] = state.selectWay.value.bankCode;
    }
    //充值状态【1:成功,2:未处理,3:已取消,不传这个字段后台不过滤此条件】
    switch(state.selectStatus.value.id){
      case 0:
        break;
      default:
        params["status"] = state.selectStatus.value.id;
        break;
    }
    ///筛选时间
    switch(state.selectTime.value.id){
      case 0:
        var endTime = DateTime.now();
        var beginTime = DateTime(endTime.year,endTime.month,endTime.day,0,0,0,0);
        params["beginTime"] = beginTime.millisecondsSinceEpoch~/1000;
        params["endTime"] = endTime.millisecondsSinceEpoch~/1000;
        break;
      case 1:
        var endTime = DateTime.now();
        var beginTime = endTime.subtract(const Duration(days: 7));
        params["beginTime"] = beginTime.millisecondsSinceEpoch~/1000;
        params["endTime"] = endTime.millisecondsSinceEpoch~/1000;
        break;
      case 2:
        var endTime = DateTime.now();
        var beginTime = endTime.subtract(const Duration(days: 30));
        params["beginTime"] = beginTime.millisecondsSinceEpoch~/1000;
        params["endTime"] = endTime.millisecondsSinceEpoch~/1000;
        break;
    }
    HttpService.queryDepositLog(params).then((value) {
      state.data.assignAll(value);
      state.data.refresh();
    });
  }



}
