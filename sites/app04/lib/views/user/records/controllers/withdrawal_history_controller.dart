import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class WithdrawalHistoryController  extends BaseController {
  int selectTimeTableIndex = 0;

  String startWithdrawTime = "";
  String endWithdrawTime = "";
  int withdrawCurPage = 1;
  String rechargeCurState = "0";
  String selectCurStr = "全部状态";

  //提现记录
  RxList<WidthdrawItem> widthdrawItemList = RxList([]);
  String moneyTotal="0";

  UserReportProvider provider = UserReportProvider();
  static WithdrawalHistoryController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }
  void setStateIndex(int typeIndex,String betType,String selectStr ){
    // selectTableIndex = typeIndex;
    rechargeCurState = betType;
    selectCurStr = selectStr;
    update();
  }

  @override
  void onInit() {
    String startTime = getStartDate();
    String endTime = getEndDate();
    startWithdrawTime = startTime;
    endWithdrawTime = endTime;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        withdrawCurPage = withdrawCurPage + 1;
        if (!hasMorePage) return;
        getRechageList();
      }
    });
    getRechageList(true);
  }


  void onRefresh(){
    withdrawCurPage = 1;
    rechargeCurState = "0";
    getRechageList(true);
  }
  //"2022-05-03 17:38:00.000";
  void confirmRechargeStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startWithdrawTime = selectDate;
      getRechageList(true);
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endWithdrawTime = selectDate;
      getRechageList(true);
    }
  }


  void selectDate(int value) {
    if (value == 0) {
      startWithdrawTime = getStartDate();
      endWithdrawTime = getEndDate();
    } else if (value == 1) {
      startWithdrawTime = getLastDate();
      endWithdrawTime = getLastDate();
    } else if (value == 2) {
      startWithdrawTime = getLastSevenDate();
      endWithdrawTime = getEndDate();
    }
    if(value<3){
      getRechageList(true);
    }
    print(startWithdrawTime+"-----111111-----"+endWithdrawTime);
  }


  //充值记录
  void getRechageList([bool isRefresh = false]) async {
    if (isRefresh) {
      withdrawCurPage = 1;
    }
    SelectDateDto dto = SelectDateDto(
      startTime: startWithdrawTime+" 00:00:00",
      endTime: endWithdrawTime+" 23:59:59",
      currentPage: withdrawCurPage,
      currentPageTotal: 20,
      type: "",
      state:rechargeCurState,
    );
    await fetchHandler<WidthdrawEntity>(
        provider.withdrawReport(dto),
        loading: isRefresh,
        onSuccess: (res) {
          if (isRefresh) {
            widthdrawItemList.clear();
            hasMorePage = true;
          }
          if ((res.total! / withdrawCurPage).floor() <= withdrawCurPage) {
            hasMorePage = false;
          }
          widthdrawItemList.addAll(res.items!);
          moneyTotal = res.money ?? "0";
        },
        onComplete: () {
          if (withdrawCurPage == 1 && widthdrawItemList.isEmpty) {
            pageState = PageState.empty;
          }
          update();
        }
    );
  }

  Future<void> cancelOrder(String order) async {
    await fetchHandler<CommonTipsEntity>(
        provider.rechargeCancel(order),
        onSuccess: (res) {
          SmartDialog.showToast(res.message!);
        }
    );
  }


}