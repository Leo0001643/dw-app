import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'member_rebate_state.dart';

class MemberRebateLogic extends GetxController {
  final MemberRebateState state = MemberRebateState();

  @override
  void onReady() {
    loadData();
    loadList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {

    ///返回说明
    HttpService.getNewsBack("fssm").then((value) {
      state.backWaterDesc = value;
    });

    var user = AppData.user();
    ///查询组合占比
    HttpService.queryConstituteRatio({"oid":user?.oid,"username":user?.username}).then((value) {
      state.constituteRatio.value = value;
      state.constituteRatio.refresh();
    });
  }


  void loadList(){

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username};
    // ///筛选时间
    // switch(state.selectTime.value.id){
    //   case 0:
    //     var endTime = DateTime.now();
    //     var beginTime = DateTime(endTime.year,endTime.month,endTime.day,0,0,0,0);
    //     params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     break;
    //   case 1:
    //     var endTime = DateTime.now();
    //     var beginTime = endTime.subtract(const Duration(days: 7));
    //     params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     break;
    //   case 2:
    //     var endTime = DateTime.now();
    //     var beginTime = endTime.subtract(const Duration(days: 15));
    //     params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     break;
    //   case 3:
    //     var endTime = DateTime.now();
    //     var beginTime = endTime.subtract(const Duration(days: 30));
    //     params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    //     break;
    // }
    var dateRange = getRangeDate();
    params["beginDate"] = dateRange.first;
    params["endDate"] = dateRange.last;

    ///回水统计
    HttpService.backWaterTotal(params).then((value) {
      state.list.assignAll(value);
      state.list.refresh();
    });
  }


  List<String> getRangeDate(){
    List<String> dates = List.empty(growable: true);
    late DateTime endTime;
    late DateTime beginTime;
    ///筛选时间
    switch(state.selectTime.value.id){
      case 0:
        endTime = DateTime.now();
        beginTime = DateTime(endTime.year,endTime.month,endTime.day,0,0,0,0);
        break;
      case 1:
        endTime = DateTime.now();
        beginTime = endTime.subtract(const Duration(days: 7));
        break;
      case 2:
        endTime = DateTime.now();
        beginTime = endTime.subtract(const Duration(days: 15));
        break;
      case 3:
        endTime = DateTime.now();
        beginTime = endTime.subtract(const Duration(days: 30));
        break;
    }
    dates.add(DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d));
    dates.add(DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d));

    return dates;
  }




}
