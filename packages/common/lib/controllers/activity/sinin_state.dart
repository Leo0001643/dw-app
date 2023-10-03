import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common.dart';

class SininState {
  RxList<SevenDay> dayList = RxList<SevenDay>([]);
  RxList<SevenDay> signinRecordList = RxList<SevenDay>([]);
  RxList<SininHeaderItem> showHeaderItem = RxList<SininHeaderItem>(); //展示用的
  RxList<SininHeaderItem> headerItem =
      RxList<SininHeaderItem>(sininHeaderItem); //静态的
  List<String> weekList = [
    '周日',
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
  ];
  List<String> weekListForApp4 = [
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
    '周日',
  ];

  List<String> weekListForAppZ1 = [
    '周一'.tr,
    '周二'.tr,
    '周三'.tr,
    '周四'.tr,
    '周五'.tr,
    '周六'.tr,
    '周日'.tr,
  ];
}

class SininHeaderItem {
  String imageName;
  String beforTitle;
  String type;
  String? prefixBeforTitle; //已签到/连续签到/可补签
  String? suffixBeforTitle; // 2天

  SininHeaderItem(
      {required this.imageName,
      required this.beforTitle,
      required this.type,
      this.prefixBeforTitle,
      this.suffixBeforTitle});
}

final List<SininHeaderItem> sininHeaderItem = [
  SininHeaderItem(
    imageName: 'assets/images/activity/sinin_list_one.svg',
    beforTitle: 'sinin.day'.tr,
    type: '1',
  ),
  SininHeaderItem(
      imageName: 'assets/images/activity/sinin_list_tow.svg',
      beforTitle: 'sinin.continuity.day'.tr,
      type: '2'),
  SininHeaderItem(
      imageName: 'assets/images/activity/sinin_list_three.svg',
      beforTitle: 'sinin.repair.day'.tr,
      type: '3'),
];

class SininLabelState {
  late String labelText;
  late Color labelColor;
  late Color groundColor;
  late Color topGroundColor;
  late Color toplabeldColor;
  late String showType;

  SininLabelState({
    required this.labelColor,
    required this.groundColor,
    required this.labelText,
    required this.topGroundColor,
    required this.toplabeldColor,
    required this.showType,
  });
}
