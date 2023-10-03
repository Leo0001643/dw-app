import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class RechargeRecordController extends BaseController {
  int selectTimeTableIndex = 0;

  String startRechargeTime = "";
  String endRechargeTime = "";
  int rechargeCurPage = 1;

  //充值记录
  RxList<Items> rechageList = RxList([]);
  String moneyTotal = "0";

  UserReportProvider provider = UserReportProvider();

  static RechargeRecordController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }

  @override
  void onInit() {
    String startTime = getStartDate();
    String endTime = getEndDate();
    startRechargeTime = startTime;
    endRechargeTime = endTime;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        rechargeCurPage = rechargeCurPage + 1;
        if (!hasMorePage) return;
        getRechageList();
      }
    });
    getRechageList(true);
  }

  void onRefresh() {
    rechargeCurPage = 1;
    getRechageList(true);
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startRechargeTime = selectDate;
      getRechageList(true);
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endRechargeTime = selectDate;
      getRechageList(true);
    }
  }

  void selectDate(int value) {
    if (value == 0) {
      startRechargeTime = getStartDate();
      endRechargeTime = getEndDate();
    } else if (value == 1) {
      startRechargeTime = getLastDate();
      endRechargeTime = getLastDate();
    } else if (value == 2) {
      startRechargeTime = getLastSevenDate();
      endRechargeTime = getEndDate();
    }
    if (value < 3) {
      getRechageList(true);
    }
    print(startRechargeTime + "-----111111-----" + endRechargeTime);
  }

  //充值记录
  void getRechageList([bool isRefresh = false]) async {
    SelectDateDto dto = SelectDateDto(
      startTime: startRechargeTime + " 00:00:00",
      endTime: endRechargeTime + " 23:59:59",
      currentPage: rechargeCurPage,
      currentPageTotal: 20,
      type: "",
    );

    await fetchHandler<RechargeEntity>(provider.depositReport(dto),
        loading: isRefresh, onSuccess: (res) {
      if (isRefresh) {
        rechageList.clear();
        hasMorePage = true;
      }
      if ((res.total! / rechargeCurPage).floor() <= rechargeCurPage) {
        hasMorePage = false;
      }
      moneyTotal = res.money ?? "0";
      rechageList.addAll(res.items!);
    }, onComplete: () {
      if (rechargeCurPage == 1 && rechageList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }

  Future<void> cancelOrder(String order) async {
    await fetchHandler<CommonTipsEntity>(
      provider.rechargeCancel(order),
      onSuccess: (res) {
        SmartDialog.showToast(res.message!);
        getRechageList(true);
      },
    );
  }
}
