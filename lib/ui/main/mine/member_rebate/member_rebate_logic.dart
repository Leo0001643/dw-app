import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';

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
    var now = DateTime.now().toUtc().subtract(Duration(hours: 12));

    ///筛选时间
    switch(state.selectTime.value.id){
      case 0:
        beginTime = DateTime(now.year,now.month,now.day,0,0,0);
        endTime = DateTime(now.year,now.month,now.day,23,59,59);
        break;
      case 1:
        beginTime = DateTime(now.year,now.month,now.day,0,0,0).subtract(const Duration(days: 6));
        endTime = DateTime(now.year,now.month,now.day,23,59,59);
        break;
      case 2:
        beginTime = DateTime(now.year,now.month,now.day,0,0,0).subtract(const Duration(days: 14));
        endTime = DateTime(now.year,now.month,now.day,23,59,59);
        break;
      case 3:
        beginTime = DateTime(now.year,now.month,now.day,0,0,0).subtract(const Duration(days: 29));
        endTime = DateTime(now.year,now.month,now.day,23,59,59);
        break;
    }
    dates.add(DataUtils.format24Hour(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d));
    dates.add(DataUtils.format24Hour(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d));

    return dates;
  }




}
