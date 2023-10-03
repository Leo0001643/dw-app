import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BetHistoryController extends BaseController {
  int selectTimeTableIndex = 0;
  int lastTableIndex = 0;
  int selectTableIndex = 0;
  String startBetTime = "";
  String endBetTime = "";
  int betCurPage = 1;
  String betCurType = "";
  String selectCurStr = "请选择";
  String totalBet = "0";
  String totalValidBet = "0";
  String totalBetWin = "0";
  //投注记录
  RxList<Bets> betList = RxList([]);
  String moneyTotal = "0";

  UserReportProvider provider = UserReportProvider();
  static BetHistoryController get to => Get.find();
  bool hasMorePage = true;
  ScrollController scrollController = ScrollController();

  void setTableIndex(int tableIndex) {
    selectTimeTableIndex = tableIndex;
    selectDate(selectTimeTableIndex);
    update();
  }

  void setTypeIndex(int typeIndex, String betType, String selectStr) {
    selectTableIndex = typeIndex;
    betCurType = betType;
    selectCurStr = selectStr;
    update();
  }

  @override
  void onInit() {
    String startTime = getStartDate();
    String endTime = getEndDate();
    startBetTime = startTime;
    endBetTime = endTime;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        betCurPage = betCurPage + 1;
        if (!hasMorePage) return;
        getBetRecordList();
      }
    });
    getBetRecordList(true);
  }

  void onRefresh() {
    betCurPage = 1;
    getBetRecordList(true);
  }

  void confirmRechargeStart(String selectDate) {
    if (selectDate != null && selectDate != "") {
      startBetTime = selectDate;
      update();
    }
  }

  void confirmRechargeEnd(String selectDate) {
    if (selectDate != null && selectDate != "") {
      endBetTime = selectDate;
      update();
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
      getBetRecordList(true);
    }
    print(startBetTime + "-----111111-----" + endBetTime);
  }

  //投注记录
  void getBetRecordList([bool isRefresh = false]) async {
    var startDate = startBetTime.substring(0, 10);
    var endDate = endBetTime.substring(0, 10);
    SelectDateDto dto = SelectDateDto(
        startTime: startDate,
        endTime: endDate,
        currentPage: betCurPage,
        currentPageTotal: 999,
        type: betCurType);
    await fetchHandler<BetRecordData>(
      provider.betReport(dto),
      loading: isRefresh,
      onSuccess: (res) {
        // res.bets = [
        //   Bets(
        //       id: 1,
        //       game_id: 11,
        //       game_tag: 'tag',
        //       name_cn: 'name',
        //       type: 1,
        //       betSum: '12',
        //       betWin: '1233',
        //       game_name: 'game_name')
        // ];

        if (isRefresh) {
          betList.clear();
        }
        if (res.bets?.isEmpty == true) {
          return;
        }
        betList.addAll(res.bets!);
        double totalBetDouble = 0;
        double totalVaildBetDouble = 0;
        double totalVaildBetWin = 0;
        betList.forEach((v) {
          totalBetDouble += double.parse(v.betSum ?? "0.00");
          totalVaildBetDouble += double.parse(v.betValid ?? "0.00");
          totalVaildBetWin += double.parse(v.betWin ?? "0.00");
        });
        totalBet =   double.parse(res.totalBet??'0').toStringAsFixed(2); // totalBetDouble.toStringAsFixed(2);
        totalValidBet = double.parse(res.totalBetValid??'0').toStringAsFixed(2);//totalVaildBetDouble.toStringAsFixed(2);
        totalBetWin =  double.parse(res.totalBetWin??'0').toStringAsFixed(2);//totalVaildBetDouble.toStringAsFixed(2);
        update();
      },
    );
  }

  String getSubBetId(String betId) {
    var returnStr = betId;
    if (betId.length >= 6) {
      returnStr =
          '${betId.toString().substring(0, 2)} ***${betId.toString().substring(betId.toString().length - 5)}';
    }
    return returnStr;
  }
}
