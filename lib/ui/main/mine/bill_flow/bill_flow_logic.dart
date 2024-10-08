import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';

import 'bill_flow_state.dart';

class BillFlowLogic extends GetxController {
  final BillFlowState state = BillFlowState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(bool refresh) {
    if(refresh){ state.page = 1; }

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,};
    ///当前选择的钱包类型
    params["cur"] = state.selectIndex == 0 ? 1:5;
    params["page"] = state.page;
    params["pageSize"] = Constants.pageSize;
    var now = DateTime.now().subtract(const Duration(hours: 12));

    ///筛选时间
    switch(state.selectTime.value.id){
      case 0:
        var beginTime = DateTime(now.year,now.month,now.day,0,0,0);
        var endTime = DateTime(now.year,now.month,now.day,23,59,59);
        params["beginTime"] = DataUtils.format24Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format24Hour(endTime.millisecondsSinceEpoch);
        break;
      case 1:
        var beginTime = DateTime(now.year,now.month,now.day,0,0,0).subtract(const Duration(days: 6));
        var endTime = DateTime(now.year,now.month,now.day,23,59,59);
        params["beginTime"] = DataUtils.format24Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format24Hour(endTime.millisecondsSinceEpoch);
        break;
      case 2:
        var beginTime = DateTime(now.year,now.month,now.day,0,0,0).subtract(const Duration(days: 14));
        var endTime = DateTime(now.year,now.month,now.day,23,59,59);
        params["beginTime"] = DataUtils.format24Hour(beginTime.millisecondsSinceEpoch);
        params["endTime"] = DataUtils.format24Hour(endTime.millisecondsSinceEpoch);
        break;
    }

    /// 交易类型【0:所有交易记录,1:出入款,2:额度转换,4:红包】
    switch(state.selectStatus.value.id){
      case 0:
        params["fromKeyType"] = 0;
        break;
      case 1:
        params["fromKeyType"] = 1;
        break;
      case 2:
        params["fromKeyType"] = 2;
        break;
    }

    HttpService.sys800(params).then((value) {
      state.page ++;
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, value.list);
    }).catchError((e,stack){
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, null);
    });
  }
  
  
  
}
