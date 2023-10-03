import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class BillRecordsController extends BaseController {
  String startReportTime = "";
  String endReportTime = "";

  int currentPage = 1;
  final RxList<String> typeList = RxList<String>([]);

  //报表记录
  RxList<ReportItems> billRecordsList = RxList([]);
  String moneyTotal = "0";
  String reportCurValue = "";
  String reportCurStr = "存款";

  UserReportProvider provider = UserReportProvider();
  static BillRecordsController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  //显示账单类型
  final RxBool _isTypeShow = false.obs;
  set isTypeShow(bool value) => _isTypeShow.value = value;
  bool get isTypeShow => _isTypeShow.value;

  //显示日期
  final RxBool _isDateShow = false.obs;
  set isDateShow(bool value) => _isDateShow.value = value;
  bool get isDateShow => _isDateShow.value;

  //资金类别的选项
  int selectTypeIndex = 0;

  //日期的选项
  final RxInt _selectDateIndex = 0.obs;
  set selectDateIndex(int value) => _selectDateIndex.value = value;
  int get selectDateIndex => _selectDateIndex.value;

  //充值记录
  RxList<Items> rechargeRecordsList = RxList([]);
  //提现记录
  RxList<WidthdrawItem> withdrawRecordsList = RxList([]);

  final RxBool _isCancelOrderSubmitting = false.obs;
  bool get isCancelOrderSubmitting => _isCancelOrderSubmitting.value;
  set isCancelOrderSubmitting(bool value) =>
      _isCancelOrderSubmitting.value = value;

  @override
  void onInit() {
    super.onInit();

    startReportTime = getStartDate();
    endReportTime = getEndDate();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('12312331213:$currentPage');
        // currentPage = currentPage + 1;
        print('222222:$currentPage');

        if (!hasMorePage) return;
        onLoadMore();
      }
    });
    onRefresh();
  }

  void onRefresh() {
    currentPage = 1;
    if (selectTypeIndex == 0) {
      getRechargeList(true);
    } else if (selectTypeIndex == 1) {
      getWithdrawList(true);
    } else {
      getBillRecords(true);
    }
  }

  void onLoadMore() {
    if (selectTypeIndex == 0) {
      getRechargeList(false);
    } else if (selectTypeIndex == 1) {
      getWithdrawList(false);
    } else {
      getBillRecords(false);
    }
  }

  void confirmDate(String start, String end) {
    if (start.isNotEmpty && end.isNotEmpty) {
      startReportTime = start;
      endReportTime = end;
      getBillRecords(true);
      update();
    }
  }

  void setReportCurValue(String curValue, String curStr) {
    reportCurValue = curValue;
    reportCurStr = curStr;
  }

  void setReportIndex(int index) {
    selectTypeIndex = index;
    update();
  }

  void selectDate(int value) {
    if (value == 0) {
      startReportTime = getStartDate();
      endReportTime = getEndDate();
    } else if (value == 1) {
      startReportTime = getLastDate();
      endReportTime = getLastDate();
    } else if (value == 2) {
      startReportTime = getLastSevenDate();
      endReportTime = getEndDate();
    }
    if (value < 3) {
      getBillRecords(true);
    }
  }

  getDateString() {
    String str = recordsDateList[selectDateIndex];
    if (selectDateIndex == 4) {
      str = '$startReportTime\n$endReportTime';
    }
    return str;
  }

  ///选择了账单类型
  billRecordSelectMenuResult(int selectedIndex) {
    selectTypeIndex = selectedIndex;
    List<SelectEntity> list = getCommonReportListData;
    reportCurValue = list[selectTypeIndex].value ?? "";
    reportCurStr = list[selectTypeIndex].name ?? "";
    Future.delayed(const Duration(milliseconds: 400), () {
      isTypeShow = !isTypeShow;
    });
    update();
    onRefresh();
  }

  SelectDateDto getDateDto() {
    if (selectDateIndex == 0) {
      startReportTime = getStartDate();
      endReportTime = getEndDate();
    } else if (selectDateIndex == 1) {
      startReportTime = getLastDate();
      endReportTime = getLastDate();
    } else if (selectDateIndex == 2) {
      startReportTime = getLastSevenDate();
      endReportTime = getEndDate();
    } else if (selectDateIndex == 3) {
      startReportTime = getLastThirtyDate();
      endReportTime = getEndDate();
    }

    SelectDateDto dto = SelectDateDto(
      startTime: "$startReportTime 00:00:00",
      endTime: "$endReportTime 23:59:59",
      currentPage: currentPage,
      currentPageTotal: 20,
      type: reportCurValue,
    );
    return dto;
  }

  ///账单记录（除了充值和提现以外）
  void getBillRecords([bool isRefresh = false]) async {
    SelectDateDto dto = getDateDto();
    await fetchHandler<ReportEntity>(provider.statementReport(dto),
        loading: currentPage == 1, onSuccess: (res) {
      if (isRefresh) {
        billRecordsList.clear();
        hasMorePage = true;
      }
      if ((res.total! / currentPage).floor() <= currentPage) {
        hasMorePage = false;
      } else {
        currentPage++;
      }
      billRecordsList.addAll(res.items!);
      moneyTotal = res.sum!.total ?? "0";
    }, onComplete: () {
      if (currentPage == 1 && billRecordsList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }

  ///提现记录
  void getWithdrawList([bool isRefresh = false]) async {
    SelectDateDto dto = getDateDto();
    await fetchHandler<WidthdrawEntity>(provider.withdrawReport(dto),
        loading: currentPage == 1, onSuccess: (res) {
      if (isRefresh) {
        withdrawRecordsList.clear();
        hasMorePage = true;
      }
      if ((res.total! / currentPage).floor() <= currentPage) {
        hasMorePage = false;
      }
      withdrawRecordsList.addAll(res.items!);
      moneyTotal = res.money ?? "0";
    }, onComplete: () {
      if (currentPage == 1 && withdrawRecordsList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }

  ///充值记录
  void getRechargeList([bool isRefresh = false]) async {
    SelectDateDto dto = getDateDto();
    await fetchHandler<RechargeEntity>(provider.depositReport(dto),
        loading: currentPage == 1, onSuccess: (res) {
      if (isRefresh) {
        rechargeRecordsList.clear();
        hasMorePage = true;
      }
      if ((res.total! / currentPage).floor() <= currentPage) {
        hasMorePage = false;
      }
      moneyTotal = res.money ?? "0";
      rechargeRecordsList.addAll(res.items!);
    }, onComplete: () {
      if (currentPage == 1 && rechargeRecordsList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }

  ///特殊扣款 额度转换 是负数
  get fushuSymbol {
    return (selectTypeIndex == 5 || selectTypeIndex == 9) ? '-' : '';
  }

  ///取消充值订单
  Future<void> cancelOrder(String order) async {
    isCancelOrderSubmitting = true;
    await fetchHandler<CommonTipsEntity>(provider.rechargeCancel(order),
        onSuccess: (res) {
      isCancelOrderSubmitting = false;
      SmartDialog.showToast(res.message!);
      if (Get.isDialogOpen == true) {
        Get.back();
      }

      ///刷新存款列表
      onRefresh();
    }, onComplete: () {
      isCancelOrderSubmitting = false;
    });
  }
}
