import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class BackHistoryController  extends BaseController {
  int selectTimeTableIndex = 0;

  String startBackTime = "";
  String endBackTime = "";
  int backCurPage = 1;
  String curState = "";
  String selectCurStr = "全部状态";

  //返水记录
  RxList<BackwaterItem> backItemList = RxList([]);
  String moneyTotal="0";
  String hasGetMoney = "0.00";
  String unGetMoney = "0.00";

  UserReportProvider provider = UserReportProvider();
  static BackHistoryController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }

  void setStateIndex(int typeIndex,String betType,String selectStr ){
    // selectTableIndex = typeIndex;
    curState = betType;
    selectCurStr = selectStr;
    update();
  }


  @override
  void onInit() {
    String startTime = getStartDate();
    String endTime = getEndDate();
    startBackTime = startTime;
    endBackTime = endTime;
    rebateAmount();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        backCurPage = backCurPage + 1;
        if (!hasMorePage) return;
        getBackwaterList();
      }
    });
    getBackwaterList(true);
  }


  void onRefresh(){
    backCurPage = 1;
    getBackwaterList(true);
  }
  //"2022-05-03 17:38:00.000";
  void confirmRechargeStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startBackTime = selectDate;
      getBackwaterList(true);
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endBackTime = selectDate;
      getBackwaterList(true);
    }
  }


  void selectDate(int value) {
    if (value == 0) {
      startBackTime = getStartDate();
      endBackTime = getEndDate();
    } else if (value == 1) {
      startBackTime = getLastDate();
      endBackTime = getLastDate();
    } else if (value == 2) {
      startBackTime = getLastSevenDate();
      endBackTime = getEndDate();
    }
    if(value<3){
      getBackwaterList(true);
    }
    print(startBackTime+"-----111111-----"+endBackTime);
  }
  Future<void> rebateAmount() async {
    await fetchHandler<FsMoneyEntity>(provider.rebateAmount(),
        onSuccess: (res) {
          hasGetMoney = decimalString(res.receive ?? "0.00");
          unGetMoney = decimalString(res.unReceive ?? "0.00");
          update();
        });
  }

  Future<void> collectRebate() async {
    try {
      if (double.parse(unGetMoney) > 0.0) {
        await fetchHandler<HandleFsEntity>(provider.collectRebate(),
            onSuccess: (res) {
              SmartDialog.showToast('e02.get.success'.tr);
               rebateAmount();
            });
      }else{
        SmartDialog.showToast('e02.get.fail'.tr);
      }
    } catch (e) {
      print(e);
    }
  }

  //返水记录
  void getBackwaterList([bool isRefresh = false]) async {
    SelectDateDto dto = SelectDateDto(
      startTime: startBackTime+ " 00:00:00",
      endTime: endBackTime+ " 23:59:59",
      currentPage: backCurPage,
      currentPageTotal: 20,
      state: curState
    );

    await fetchHandler<BackwaterEntity>(provider.rebateReport(dto),
        loading: isRefresh, onSuccess: (res) {
          if (isRefresh) {
            backItemList.clear();
            hasMorePage = true;
          }
          if ((res.total! / backCurPage).floor() <= backCurPage) {
            hasMorePage = false;
          }
          moneyTotal = res.money??"0";
          backItemList.addAll(res.items!);
        }, onComplete: () {
          if (backCurPage == 1 && backItemList.isEmpty) {
            pageState = PageState.empty;
          }
          update();
        });
  }


}