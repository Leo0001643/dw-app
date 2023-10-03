import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs_record.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetBackwaterController extends BaseController {
  static BetBackwaterController get to => Get.find();

  //返水记录
  RxList<BackwaterItem> backItemList = RxList([]);
  ScrollController scrollController = ScrollController();
  UserReportProvider provider = UserReportProvider();

  String startBackTime = "";
  String endBackTime = "";
  int backCurPage = 1;
  String dateCurStr = "user.center.report.curday".tr;
  String dateCurValue = "";
  bool hasMorePage = true;
  String hasGetMoney = "0.00";
  String unGetMoney = "0.00";
  bool isShowBackWater = false;
  LadderFsEntity? fsEntity;
  int selectIndex = 0;
  List<RecordItems>? recordItems;
  List<LadderItems> items = [];
  List<SubItems> subItems = [];
  int selectSubIndex = 0;
  String yxType = "";
  String yxCs = "";
  bool isLoading = true;
  bool isShowEmptyView = true;

  bool get hasDetail => !isShowBackWater && (fsEntity?.isShow ?? 0) == 1;

  @override
  void onInit() {
    String startTime = getStartTime();
    String endTime = getEndTime();
    startBackTime = startTime;
    endBackTime = endTime;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {}
    });

    super.onInit();
  }

  @override
  void onReady() {
    getBackwaterType();
    rebateAmount();
    super.onReady();
  }

  void toBackPage() {
    print(11123);
  }

  String getImageString(int i, bool isSelect) {
    List<String> imageList1 = [
      'assets/images/betback/a1.png',
      'assets/images/betback/b1.png',
      'assets/images/betback/c1.png',
      'assets/images/betback/d1.png',
      'assets/images/betback/e1.png',
      'assets/images/betback/f1.png',
      'assets/images/betback/h1.png'
    ];
    List<String> imageList2 = [
      'assets/images/betback/a2.png',
      'assets/images/betback/b2.png',
      'assets/images/betback/c2.png',
      'assets/images/betback/d2.png',
      'assets/images/betback/e2.png',
      'assets/images/betback/f2.png',
      'assets/images/betback/h2.png'
    ];

    if (isSelect) {
      if (i > imageList2.length) {
        return imageList2[0];
      }
      return imageList2[i];
    } else {
      if (i > imageList1.length) {
        return imageList1[0];
      }
      return imageList1[i];
    }
  }

  String getIconString(String tabName, bool isSelect) {
    String siteTag = AppEnv.config.siteTag ?? "h09";
    if (siteTag == "h09") {
      if (tabName == "视讯") {
        return isSelect
            ? "assets/images/betback/shixun2.png"
            : "assets/images/betback/shixun1.png";
      } else if (tabName == "电子") {
        return isSelect
            ? "assets/images/betback/a2.png"
            : "assets/images/betback/a1.png";
      } else if (tabName == "体育") {
        return isSelect
            ? "assets/images/betback/d2.png"
            : "assets/images/betback/d1.png";
      } else if (tabName == "彩票") {
        return isSelect
            ? "assets/images/betback/f2.png"
            : "assets/images/betback/f1.png";
      } else if (tabName == "电竞" || tabName == "电游") {
        return isSelect
            ? "assets/images/betback/dianjin2.png"
            : "assets/images/betback/dianjin1.png";
      } else if (tabName == "捕鱼") {
        return isSelect
            ? "assets/images/betback/c2.png"
            : "assets/images/betback/c1.png";
      } else if (tabName == "棋牌") {
        return isSelect
            ? "assets/images/betback/qipai2.png"
            : "assets/images/betback/qipai1.png";
      }
    } else if (siteTag == "b97") {
      if (tabName == "视讯") {
        return isSelect
            ? "assets/images/betback/b97/shixun_a2.png"
            : "assets/images/betback/b97/shixun_a1.png";
      } else if (tabName == "电子" || tabName == "电游") {
        return isSelect
            ? "assets/images/betback/b97/dianyou_a2.png"
            : "assets/images/betback/b97/dianyou_a1.png";
      } else if (tabName == "体育") {
        return isSelect
            ? "assets/images/betback/b97/tiyu_a2.png"
            : "assets/images/betback/b97/tiyu_a1.png";
      } else if (tabName == "彩票") {
        return isSelect
            ? "assets/images/betback/b97/caipiao_a2.png"
            : "assets/images/betback/b97/caipiao_a1.png";
      } else if (tabName == "电竞") {
        return isSelect
            ? "assets/images/betback/b97/dianjing_a2.png"
            : "assets/images/betback/b97/dianjing_a1.png";
      } else if (tabName == "捕鱼") {
        return isSelect
            ? "assets/images/betback/b97/buyu_a2.png"
            : "assets/images/betback/b97/buyu_a1.png";
      } else if (tabName == "棋牌") {
        return isSelect
            ? "assets/images/betback/b97/qipai_a2.png"
            : "assets/images/betback/b97/qipai_a1.png";
      }
    }
    return getDefaultString(tabName, isSelect);
  }

  String getDefaultString(String tabName, bool isSelect) {
    //String siteTag = appThemeConfig.siteTag ?? "h09";

    if (tabName == "视讯") {
      return isSelect
          ? "assets/images/betback/shixun2.png"
          : "assets/images/betback/shixun1.png";
    } else if (tabName == "电子" || tabName == "电游") {
      return isSelect
          ? "assets/images/betback/a2.png"
          : "assets/images/betback/a1.png";
    } else if (tabName == "体育") {
      return isSelect
          ? "assets/images/betback/d2.png"
          : "assets/images/betback/d1.png";
    } else if (tabName == "彩票") {
      return isSelect
          ? "assets/images/betback/f2.png"
          : "assets/images/betback/f1.png";
    } else if (tabName == "电竞") {
      return isSelect
          ? "assets/images/betback/dianjin2.png"
          : "assets/images/betback/dianjin1.png";
    } else if (tabName == "捕鱼") {
      return isSelect
          ? "assets/images/betback/c2.png"
          : "assets/images/betback/c1.png";
    } else if (tabName == "棋牌") {
      return isSelect
          ? "assets/images/betback/qipai2.png"
          : "assets/images/betback/qipai1.png";
    }

    return isSelect
        ? "assets/images/betback/shixun2.png"
        : "assets/images/betback/shixun1.png";
  }

  void setDateCurStr(String curStr) {
    dateCurStr = curStr;
    update();
  }

  void setYxType() {
    if (selectIndex <= items.length - 1) {
      yxType = items[selectIndex].label ?? '';
    }
  }

  void setYxCs() {
    if (selectSubIndex <= subItems.length - 1) {
      yxCs = subItems[selectSubIndex].nameCn ?? '游戏厂商';
    } else {
      yxCs = '游戏厂商';
    }
  }

  void setSelectIndex(int index) {
    selectIndex = index;
    if (index <= items.length - 1) {
      yxType = items[selectIndex].label ?? '';
      subItems = (items[selectIndex].items ?? [])
          .where((element) => (element.fsInfo?.state == 1 ||
              (double.tryParse(element.fsRate ?? '0.00') ?? 0.00) > 0 ||
              (double.tryParse(element.fsInfo?.fsBl ?? '0.00') ?? 0.00) > 0))
          .toList();

      if (subItems.isNotEmpty) {
        selectSubIndex = 0;
        if (selectSubIndex <= subItems.length - 1) {
          yxCs = subItems[selectSubIndex].nameCn ?? '游戏厂商';
        }
      } else {
        yxCs = '游戏厂商';
      }
    }
    update();
  }

  void setSubSelectIndex(int index) {
    selectSubIndex = index;
    if (index <= subItems.length - 1) {
      yxCs = subItems[selectSubIndex].nameCn ?? '';
    }
    update();
  }

  void setDateCurValue(String curValue) {
    dateCurValue = curValue;
    selectDate(dateCurValue);
  }

  void selectDate(String value) {
    if (value == "1") {
      startBackTime = getStartTime();
      endBackTime = getEndTime();
    } else if (value == "2") {
      startBackTime = getLastDate() + " 00:00:00";
      endBackTime = getLastDate() + " 23:59:59";
    } else if (value == "3") {
      startBackTime = getLastSevenDate() + " 00:00:00";
      endBackTime = getEndTime();
    } else if (value == "4") {
      startBackTime = getCurMonthDate() + " 00:00:00";
      endBackTime = getEndTime();
    } else if (value == "5") {
      startBackTime = getLastMonthDateStart() + " 00:00:00";
      endBackTime = getLastMonthDateEnd() + " 23:59:59";
    }
    print(startBackTime + "-----111111-----" + endBackTime);
  }

  void onRefresh() {
    update();
  }

  //"2022-05-03 17:38:00.000";
  void confirmBackStart(String selectDate) {
    if (selectDate.isNotEmpty) {
      startBackTime = selectDate.replaceAll(".000", "");
      update();
    }
  }

  //"2022-05-03 17:38:00.000";
  void confirmBackEnd(String selectDate) {
    if (selectDate.isNotEmpty) {
      endBackTime = selectDate.replaceAll(".000", "");
      update();
    }
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
          getBackwaterType();
          rebateAmount();
        });
      } else {
        SmartDialog.showToast('e02.get.fail'.tr);
      }
    } catch (e) {
      print(e);
    }
  }

  void changeView() {
    isShowBackWater = !isShowBackWater;
    update();
  }

  //获取分类
  void getBackwaterType() async {
    SmartDialog.showLoading();
    await fetchHandler<LadderFsEntity>(provider.getBetBackwater(),
        loading: isLoading, onSuccess: (res) {
      fsEntity = res;
      isLoading = false;
      items = res.items ?? [];
      if (items.isNotEmpty) {
        isShowEmptyView = false;
        if (selectIndex < items.length - 1) {
          subItems = (items[selectIndex].items ?? [])
              .where((element) => (element.fsInfo?.state == 1 ||
                  (double.tryParse(element.fsRate ?? '0.00') ?? 0.00) > 0 ||
                  (double.tryParse(element.fsInfo?.fsBl ?? '0.00') ?? 0.00) >
                      0))
              .toList();
        }
      }
      isShowBackWater = fsEntity?.fsType == 1;
      update();
    }).whenComplete(() => SmartDialog.dismiss(status: SmartStatus.loading));
  }
}
