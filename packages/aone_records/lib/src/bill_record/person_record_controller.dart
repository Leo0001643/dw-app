import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class PersonRecordController extends BaseController {
  int selectTimeTableIndex = 0;

  String startReportTime = "";
  String endReportTime = "";
  int reportCurPage = 1;
  final RxList<String> typeList = RxList<String>([]);
  //报表记录
  RxList<ReportItems> reportList = RxList([]);
  String moneyTotal = "0";
  String reportCurValue = "";
  String reportCurStr = "全部";
  int reportIndex = 0;
  UserReportProvider provider = UserReportProvider();
  static PersonRecordController get to => Get.find();
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
    startReportTime = startTime;
    endReportTime = endTime;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        reportCurPage = reportCurPage + 1;
        if (!hasMorePage) return;
        getReportForm();
      }
    });
    getReportForm(true);
  }

  void onRefresh() {
    reportCurPage = 1;
    getReportForm(true);
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startReportTime = selectDate;
      getReportForm(true);
      update();
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endReportTime = selectDate;
      getReportForm(true);
      update();
    }
  }

  void setReportCurValue(String curValue, String curStr) {
    reportCurValue = curValue;
    reportCurStr = curStr;
  }

  void setReportIndex(int index) {
    reportIndex = index;
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
      getReportForm(true);
    }
    print(startReportTime + "-----111111-----" + endReportTime);
  }

  //个人报表
  void getReportForm([bool isRefresh = false]) async {
    //https://pre-qt.a1pre10.com/api/user/liushui/list
    SelectDateDto dto = SelectDateDto(
      startTime: startReportTime + " 00:00:00",
      endTime: endReportTime + " 23:59:59",
      currentPage: reportCurPage,
      currentPageTotal: 20,
      type: reportCurValue,
    );
    await fetchHandler<ReportEntity>(provider.statementReport(dto),
        loading: isRefresh, onSuccess: (res) {
      if (isRefresh) {
        reportList.clear();
        hasMorePage = true;
      }
      if ((res.total! / reportCurPage).floor() <= reportCurPage) {
        hasMorePage = false;
      }
      reportList.addAll(res.items!);
      moneyTotal = res.sum!.jyh_total ?? "0";
    }, onComplete: () {
      if (reportCurPage == 1 && reportList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }
}
