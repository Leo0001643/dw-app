import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class PreferentialHistoryController extends BaseController {
  int selectTimeTableIndex = 3;
  String startYhTime = "";
  String endYhTime = "";
  int yhCurPage = 1;

  /**
   * 优惠记录
   */
  RxList<YhItem> yhItemList = RxList([]);
  UserReportProvider provider = UserReportProvider();

  static PreferentialHistoryController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  double get amount {
    double t = 0;
    for (final item in yhItemList) {
      t += item.yh_total?.toDouble ?? 0.00;
    }
    return t;
  }

  @override
  void onInit() {
    String startTime = getStartDate();
    String endTime = getEndDate();
    startYhTime = startTime;
    endYhTime = endTime;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        yhCurPage = yhCurPage + 1;
        if (!hasMorePage) return;
        getYhList();
      }
    });
    getYhList(true);
  }

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }

  void onRefresh() {
    yhCurPage = 1;
    getYhList(true);
  }

  //"2022-05-03 17:38:00.000";
  void confirmYhStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startYhTime = selectDate;
      getYhList(true);
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endYhTime = selectDate;
      getYhList(true);
    }
  }

  void selectDate(int value) {
    if (value == 0) {
      startYhTime = getStartDate();
      endYhTime = getEndDate();
    } else if (value == 1) {
      startYhTime = getLastDate();
      endYhTime = getLastDate();
    } else if (value == 2) {
      startYhTime = getLastSevenDate();
      endYhTime = getEndDate();
    }
    if (value < 3) {
      getYhList(true);
    }
    print(startYhTime + "-----111111-----" + endYhTime);
  }

  //优惠记录
  void getYhList([bool isRefresh = false]) async {
    if (isRefresh) {
      yhItemList.clear();
      hasMorePage = true;
    }
    SelectDateDto dto = SelectDateDto(
      startTime: startYhTime + " 00:00:00",
      endTime: endYhTime + " 23:59:59",
      currentPage: yhCurPage,
      currentPageTotal: 20,
    );
    await fetchHandler<PreferentialEntity>(provider.offerReport(dto),
        loading: isRefresh, onSuccess: (res) {
      if ((res.total! / yhCurPage).floor() <= yhCurPage) {
        hasMorePage = false;
      }
      yhItemList.addAll(res.items!);
    }, onComplete: () {
      if (yhCurPage == 1 && yhItemList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }
}
