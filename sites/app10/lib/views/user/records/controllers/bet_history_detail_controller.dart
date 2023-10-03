import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BetHistoryDetailController extends BaseController {
  int selectTimeTableIndex = 0;
  String startBetTime = "";
  String endBetTime = "";
  String game_tag = "";
  String title = "";
  int betCurPage = 1;
  /**
   * 优惠记录
   */
  RxList<DetailBets> betDetailList = RxList([]);
  UserReportProvider provider = UserReportProvider();
  static BetHistoryDetailController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // 支持跳转到制定页面
    Bets element = Get.arguments;
    game_tag = element.game_tag!;
    title = element.game_name!;
    String startTime = getStartDate();
    String endTime = getEndDate();
    startBetTime = startTime;
    endBetTime = endTime;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        betCurPage = betCurPage + 1;
        if (!hasMorePage) return;
        getBetDetailRecordList();
      }
    });
    getBetDetailRecordList(true);
  }

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }

  void onRefresh() {
    betCurPage = 1;
    getBetDetailRecordList(true);
  }

  //"2022-05-03 17:38:00.000";
  void confirmYhStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startBetTime = selectDate;
      getBetDetailRecordList(true);
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endBetTime = selectDate;
      getBetDetailRecordList(true);
    }
  }

  void selectDate(int value) {
    if (value == 0) {
      startBetTime = getStartDate();
      endBetTime = getEndDate();
    } else if (value == 1) {
      startBetTime = getLastDate();
      endBetTime = getLastDate();
    } else if (value == 2) {
      startBetTime = getLastSevenDate();
      endBetTime = getEndDate();
    }
    if (value < 3) {
      getBetDetailRecordList(true);
    }
    print(startBetTime + "-----111111-----" + endBetTime);
  }

//投注记录
  void getBetDetailRecordList([bool isRefresh = false]) async {
    SelectDateDto dto = SelectDateDto(
        startTime: startBetTime + " 00:00:00",
        endTime: endBetTime + " 23:59:59",
        currentPage: betCurPage,
        currentPageTotal: 20,
        game_tag: game_tag);
    await fetchHandler<RecordDetailData>(provider.betDetailReport(dto),
        loading: isRefresh, onSuccess: (res) {
      if (isRefresh) {
        betCurPage = 1;
        betDetailList.clear();
      }
      if (res != null && res.items != null) {
        List<DetailBets>? items = res.items!;
        betDetailList.addAll(items);
      }
    }, onComplete: () {
      if (betCurPage == 1 && betDetailList.isEmpty) {
        pageState = PageState.empty;
      }
      update();
    });
  }
}
