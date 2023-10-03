import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class SininLogic extends BaseController {
  SininProvider provider = SininProvider();

  ScrollController scrollController = ScrollController();
  SininState state = SininState();
  SininEntivity? sininData;
  SevenDay? todaySininData;
  bool showReissue = true;
  late int? currentIndex;
  int? originalIndex = 0;
  String? selDirection;

  @override
  void onInit() {
    selDirection = 'torigth';
    // getUserSininInfoList();
    super.onInit();
  }

//获取签到信息
  Future<SininData?> getUserSininInfoList() async {
    return await fetchHandler<SininData>(
      provider.sininInfo(),
      onSuccess: (res) {
        sininData = res.sininEntivity;

        state.dayList.clear();
        state.dayList.addAll(sininData!.sevenDay!);
        showReissue = sininData!.isShowReissue!;
        //自动偏转
        // originalIndex = state.dayList.indexWhere(
        //     (value) => value.riqiDate == getCurrentTimefor(TimeType.timetoday));
        currentIndex = originalIndex;
        scrollController.animateTo(44 * currentIndex!.toDouble(),
            duration: const Duration(microseconds: 300), curve: Curves.ease);
        print('当前下标   ${originalIndex}');
        print('当前下标   ${getCurrentTimefor(TimeType.day)}');
        todaySininData = state.dayList[originalIndex!];
        _handleData();
        update();
        print('测试签到数据');
        print(sininData?.resumeLimit.toString());
      },
    );
  }

  Future<SininBackEntivity?> postSininData() async {
    return await fetchHandler<SininBackEntivity>(
      provider.userGotoSinin(),
      onSuccess: (res) {
        print(res.statusCode);
      },
    );
  }

  postSininSuccess() {}

  Future<SininBackEntivity?> postReissueSininData(String reissueDate) async {
    return await fetchHandler<SininBackEntivity>(
      provider.postReissueSininData(reissueDate),
      onSuccess: (res) {
        print(res.statusCode);
      },
    );
  }

  //签到重置
  Future<SininBackEntivity?> postSigninReset() async {
    return await fetchHandler<SininBackEntivity>(
      provider.signinReset(),
      onSuccess: (res) {
        SmartDialog.showToast(res.message!);
        if (res.statusCode == 200) {
          // Get.back();
          getUserSininInfoList();
        } else {
          SmartDialog.showToast(res.message ?? '重置失败');
        }
      },
    );
  }

  void gotoSinin(SevenDay sevenDay) {
    if (sevenDay.state == 4) {
      postReissueSininData(sevenDay.riqiDate!);
    }
  }

  SininLabelState getSininLabel(SevenDay sevenDay) {
    switch (sevenDay.state) {
      case 0:
        {
          return SininLabelState(
            labelColor: stringToColor('543727'),
            groundColor: stringToColor('F6E1B5'),
            labelText: '待签',
            topGroundColor: stringToColor('F6E1B5'),
            toplabeldColor: stringToColor('2E2D30'),
            showType: '3',
          );
        }
      case 1:
        {
          return SininLabelState(
            labelColor: Colors.white,
            groundColor: stringToColor('2E2D30'),
            labelText: '已签',
            topGroundColor: stringToColor('2E2D30'),
            toplabeldColor: Colors.white,
            showType: '2',
          );
        }
      case 2:
        {
          return SininLabelState(
            labelColor: Colors.white,
            groundColor: stringToColor('7A7670'),
            labelText: '已补',
            topGroundColor: stringToColor('2E2D30'),
            toplabeldColor: Colors.white,
            showType: '2',
          );
        }
      case 4:
        {
          return SininLabelState(
            labelColor: Colors.white,
            groundColor: Colors.red,
            labelText: '补签',
            topGroundColor: stringToColor('F6E1B5'),
            toplabeldColor: stringToColor('2E2D30'),
            showType: '3',
          );
        }
      default:
        return SininLabelState(
          labelColor: stringToColor('543727'),
          groundColor: stringToColor('F6E1B5'),
          labelText: '过期',
          topGroundColor: stringToColor('F6E1B5'),
          toplabeldColor: stringToColor('2E2D30'),
          showType: '1',
        );
    }
  }

  void _handleData() {
    //连续天数数据拼接
    state.showHeaderItem.clear();
    state.showHeaderItem = RxList.from(state.headerItem);
    SininHeaderItem item = state.showHeaderItem[0];

    item.prefixBeforTitle = 'sinin.day'.tr;
    if (sininData!.userQiandaoInfo!.qdCount != null) {
      item.suffixBeforTitle =
          '${sininData!.userQiandaoInfo!.qdCount.toString()} ${'sinin.dayshow'.tr}';
      item.beforTitle = '${item.prefixBeforTitle}${item.suffixBeforTitle}';
    } else {
      item.suffixBeforTitle = 'sinin.dayshow'.tr;
      item.beforTitle = '${item.prefixBeforTitle} ${item.suffixBeforTitle}';
    }

    SininHeaderItem item1 = state.showHeaderItem[1];
    item1.prefixBeforTitle = 'sinin.continuity.day'.tr;
    if (sininData!.userQiandaoInfo!.lxCount != null) {
      item1.suffixBeforTitle =
          '${sininData!.userQiandaoInfo!.lxCount.toString()} ${'sinin.dayshow'.tr}';
      item1.beforTitle = '${item1.prefixBeforTitle}${item1.suffixBeforTitle}';
    } else {
      item1.suffixBeforTitle = 'sinin.dayshow'.tr;
      item1.beforTitle = '${item1.prefixBeforTitle} ${item1.suffixBeforTitle}';
    }

    SininHeaderItem item2 = state.showHeaderItem[2];
    item2.prefixBeforTitle = 'sinin.repair.day'.tr;
    if (sininData!.resumeLimit != null) {
      item2.suffixBeforTitle =
          '${sininData!.resumeLimit!.toString()} ${'sinin.dayshow'.tr}';
      item2.beforTitle = '${item2.prefixBeforTitle}${item2.suffixBeforTitle}';
    }
    if ((sininData?.isShowReissue ?? false) == false) {
      state.showHeaderItem.remove(item2);
    }
  }

  //向左右滚动
  int getCurrentIndex(String direction) {
    // selDirection

    if ((currentIndex == state.dayList.length)) {
      currentIndex = state.dayList.length;
    }
    if (direction == 'toleft') {
      selDirection = direction;
      currentIndex = currentIndex! - 1;
    } else if (direction == 'torigth') {
      selDirection = direction;
      currentIndex = currentIndex! + 1;
    }
    print('下标 == ${currentIndex}');
    if (currentIndex! <= 0) {
      currentIndex = 0;
    } else if (currentIndex! >= state.dayList.length - 7) {
      currentIndex = state.dayList.length - 7;
    }
    return currentIndex!;
  }
}

//获取签到的初始配置接口
Future<SininConfigInfo?> getSininConfigInfo() async {
  SininProvider provider = SininProvider();
  return await provider
      .sininConfigInfo()
      .then((value) => value.sininConfigInfo);
}
