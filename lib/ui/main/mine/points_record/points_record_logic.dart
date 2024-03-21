import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';

import 'points_record_state.dart';

class PointsRecordLogic extends GetxController {
  final PointsRecordState state = PointsRecordState();

  @override
  void onReady() {
    loadData(true);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData(bool refresh) {
    if(refresh){ state.page = 1; }

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username};
    params["page"] = state.page;
    params["pageSize"] = Constants.pageSize;
    ///筛选时间
    switch(state.selectTime.value.id){
      case 0:
        var endTime = DateTime.now();
        var beginTime = DateTime(endTime.year,endTime.month,endTime.day,0,0,0,0);
        params["beginTime"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch);
        break;
      case 1:
        var endTime = DateTime.now();
        var beginTime = endTime.subtract(const Duration(days: 7));
        params["beginTime"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch);
        break;
      case 2:
        var endTime = DateTime.now();
        var beginTime = endTime.subtract(const Duration(days: 15));
        params["beginTime"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch);
        break;
    }
    HttpService.queryPointLog(params).then((value) {
      state.page ++;
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, value.record);
    }).catchError((e,stack){
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, null);
    });
  }
}
