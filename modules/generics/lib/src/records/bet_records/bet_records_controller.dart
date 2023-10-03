import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BetRecordsController extends BaseController {
  String startBetTime = "";
  String endBetTime = "";
  String betCurType = "";

  String totalBet = "0";
  String totalValidBet = "0";
  String totalBetWin = "0";
  String moneyTotal = "0";

  ///明细模式分页，总览不分页
  int detailCurrentPage = 1;

  UserReportProvider provider = UserReportProvider();
  static BetRecordsController get to => Get.find();
  bool hasDetailMorePage = true;

  ///明细需要分页
  ScrollController detailScrollController = ScrollController();

  //显示账单类型
  final RxBool _isTypeShow = false.obs;
  set isTypeShow(bool value) => _isTypeShow.value = value;
  bool get isTypeShow => _isTypeShow.value;

  //显示日期
  final RxBool _isDateShow = false.obs;
  set isDateShow(bool value) => _isDateShow.value = value;
  bool get isDateShow => _isDateShow.value;

  // true:显示纵览/明细 menu
  // false:显示游戏详细分类 menu
  final RxBool _isZonglanDetailMenuShow = true.obs;
  set isZonglanDetailMenuShow(bool value) =>
      _isZonglanDetailMenuShow.value = value;
  bool get isZonglanDetailMenuShow => _isZonglanDetailMenuShow.value;

  //true:纵览  false:明细
  final RxBool _isZonglanStatus = true.obs;
  set isZonglanStatus(bool value) => _isZonglanStatus.value = value;
  bool get isZonglanStatus => _isZonglanStatus.value;

  //游戏类别的选项
  int? selectGameTypeIndex = 0;
  //gameType 不是selectGameTypeIndex
  String? gameType;

  //日期的选项
  final RxInt _selectDateIndex = 0.obs;
  set selectDateIndex(int value) => _selectDateIndex.value = value;
  int get selectDateIndex => _selectDateIndex.value;

  String betTypeName = getCommonGameTypesData.first.name ?? '';
  String startTime = "";
  String endTime = "";

  ///总览数据，过滤掉了无效数据
  RxList<List<Bets>> betZonglanList = RxList([]);

  ///明细数据
  RxList<DetailBets> betDetailLists = RxList([]);

  ///分类数据
  RxList<DetailBets> betTypeList = RxList([]);

  String? gameTag;

  getDateString() {
    String str = recordsDateList[selectDateIndex];
    if (selectDateIndex == 4) {
      str = '$startTime\n$endTime';
    }
    return str;
  }

  @override
  void onInit() {
    super.onInit();
    startTime = getStartDate();
    endTime = getEndDate();

    detailScrollController.addListener(() {
      if (detailScrollController.position.pixels ==
          detailScrollController.position.maxScrollExtent) {
        if (!hasDetailMorePage) return;
        requestBetDetailRecordList(false);
      }
    });
    onZonglanRefresh();
  }

  ///根据状态判断，刷新哪个数据
  void onRefresh() {
    if (isZonglanDetailMenuShow) {
      selectGameTypeIndex = null;
      gameTag = '';
      if (isZonglanStatus) {
        onZonglanRefresh();
      } else {
        onDetailRefresh();
      }
    } else {
      onDetailRefresh();
    }
  }

  ///刷新总览
  void onZonglanRefresh() {
    requestBetZonglanRecordList(true);
  }

  ///刷新明细
  void onDetailRefresh() {
    detailCurrentPage = 1;
    requestBetDetailRecordList(true);
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

  refreshDate() {
    if (selectDateIndex == 0) {
      startTime = getStartDate();
      endTime = getEndDate();
    } else if (selectDateIndex == 1) {
      startTime = getLastDate();
      endTime = getLastDate();
    } else if (selectDateIndex == 2) {
      startTime = getLastSevenDate();
      endTime = getEndDate();
    } else if (selectDateIndex == 3) {
      startTime = getLastThirtyDate();
      endTime = getEndDate();
    }
  }

  SelectDateDto getDateDto({int? pageTotal, int? currentPage}) {
    if (selectDateIndex == 0) {
      startTime = getStartDate();
      endTime = getEndDate();
    } else if (selectDateIndex == 1) {
      startTime = getLastDate();
      endTime = getLastDate();
    } else if (selectDateIndex == 2) {
      startTime = getLastSevenDate();
      endTime = getEndDate();
    } else if (selectDateIndex == 3) {
      startTime = getLastThirtyDate();
      endTime = getEndDate();
    }
    SelectDateDto dto = SelectDateDto(
      startTime: '$startTime 00:00:00',
      endTime: '$endTime 23:59:59',
      currentPage: currentPage ?? 1,

      /// currentPageTotal > 200,后台会返回所有的数据
      currentPageTotal: pageTotal ?? 30,
      // type: betCurType
    );
    return dto;
  }

  void confirmDateList(String start, String end) {
    if (start.isNotEmpty && end.isNotEmpty) {
      startTime = start;
      startTime = end;
      onZonglanRefresh();
    }
  }

  ///投注记录总览 默认的请求 无需分页 需要loading
  /// 返回的数据需要删选，分类
  void requestBetZonglanRecordList([bool isRefresh = false]) async {
    refreshDate();
    SelectDateDto dto = SelectDateDto(
      startTime: startTime,
      endTime: endTime,
      currentPage: 1,

      /// currentPageTotal > 200,后台会返回所有的数据
      currentPageTotal: 300,
      // type: betCurType
    );
    await fetchHandler<BetRecordData>(provider.betReport(dto),
        loading: isRefresh, onSuccess: (res) {
      if (res.bets == null || res.bets?.isEmpty == true) return;
      if (isRefresh) {
        betZonglanList.clear();
      }
      double totalBetDouble = 0;
      double totalVaildBetDouble = 0;
      double totalVaildBetWin = 0;

      ///删选无效的数据，根据类型组合
      List<List<Bets>> sevenList = [];
      for (int i = 0; i < 7; i++) {
        List<Bets> listItem = [];
        sevenList.add(listItem);
      }
      List<Bets> hasBetList = [];
      for (Bets item in res.bets!) {
        totalBetDouble += item.betSumDouble;
        totalVaildBetDouble += item.betValidDouble;
        totalVaildBetWin += item.betWinDouble;
        if (item.isHasBet) {
          List<Bets> typeList = sevenList[item.type! - 1];
          typeList.add(item);
          hasBetList.add(item);
        }
      }
      totalBet = res.totalBet2fixString;
      totalValidBet = res.totalBetValid2fixString;
      totalBetWin = res.totalBetWin2fixString;

      betZonglanList.clear();
      for (var element in sevenList) {
        if (element.isNotEmpty) {
          betZonglanList.add(element);
        }
      }
    }, onComplete: () {
      if (betZonglanList.isEmpty) {
        pageState = PageState.empty;
        update();
      }
    });
  }

  ///投注明细，需要分页
  void requestBetDetailRecordList([bool isRefresh = false]) async {
    refreshDate();
    SelectDateDto dto = SelectDateDto(
        startTime: '$startTime 00:00:00',
        endTime: '$endTime 23:59:59',
        currentPage: detailCurrentPage,
        currentPageTotal: 30,
        type: gameType,
        game_tag: gameTag);
    await fetchHandler<RecordDetailData>(provider.betDetailReport(dto),
        loading: true, onSuccess: (res) {
      if (isZonglanDetailMenuShow) {
        if (res.items == null || res.items!.isEmpty) return;
      }
      if (isRefresh) {
        detailCurrentPage = 1;
        betDetailLists.clear();
        hasDetailMorePage = true;
      }
      if ((res.total! / detailCurrentPage).floor() <= detailCurrentPage) {
        hasDetailMorePage = false;
      } else {
        detailCurrentPage++;
      }
      List<DetailBets>? items = res.items!;

      double totalBetDouble = 0;
      double totalVaildBetDouble = 0;
      double totalVaildBetWin = 0;
      List<DetailBets> hasBetList = [];
      for (DetailBets item in res.items!) {
        totalBetDouble += item.betSumDouble;
        totalVaildBetDouble += item.betValidDouble;
        totalVaildBetWin += item.betWinDouble;
        if (item.isHasBet) {
          hasBetList.add(item);
        }
      }
      totalBet = to2fixNumberByNumber(totalBetDouble);
      totalValidBet = to2fixNumberByNumber(totalVaildBetDouble);
      totalBetWin = to2fixNumberByNumber(totalVaildBetWin);

      betDetailLists.addAll(items);
    }, onComplete: () {
      if (detailCurrentPage == 1 && betDetailLists.isEmpty) {
        pageState = PageState.empty;
        update();
      }
    });
  }

  ///选择了账单类型
  billRecordSelectMenuResult(int selectedIndex) {
    selectGameTypeIndex = selectedIndex;
    SelectEntity entity = getCommonGameTypesData[selectedIndex];
    gameType = entity.value;
    betTypeName = entity.name ?? "";
    gameTag = '';
    Future.delayed(const Duration(milliseconds: 400), () {
      isTypeShow = !isTypeShow;
    });
    update();
    onRefresh();
  }

  ///切换到分类显示的投注列表
  goBetTypeList(Bets bet) {
    isZonglanDetailMenuShow = false;
    selectGameTypeIndex = (bet.type ?? 1) - 1;
    SelectEntity entity = getCommonGameTypesData[selectGameTypeIndex!];
    gameType = entity.value;
    betTypeName = entity.name ?? "";
    gameTag = null;
    betZonglanList.clear();
    pageState = PageState.empty;
    update();
    onRefresh();
  }
}
