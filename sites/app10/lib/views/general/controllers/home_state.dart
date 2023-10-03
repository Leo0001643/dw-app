import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeState {
  final RxList<NoticeItems> _noticeItems = RxList.empty();
  RxList<NoticeItems> get noticeItems => _noticeItems;
  set noticeItems(RxList<NoticeItems> value) => _noticeItems.value = value;

  // List<String> tabs =['新闻','历史','图片','视频','文字','yoyou','视频','文字'];
  TabController? tabController;

  final RxList<NoticeItems> _noticeItemsFilter = RxList.empty();
  RxList<NoticeItems> get noticeItemsFilter => _noticeItemsFilter;
  set noticeItemsFilter(RxList<NoticeItems> value) =>
      _noticeItemsFilter.value = value;

  var _hotAllGameTotal = 0.obs;
  int get hotAllGameTotal => _hotAllGameTotal.value;
  set hotAllGameTotal(value) => _hotAllGameTotal.value = value;

  final _hotAllGameItem = <SubChildren>[].obs;
  RxList<SubChildren> get hotAllGameItem => _hotAllGameItem;
  set hotAllGameItem(value) => _hotAllGameItem.value = value;
}
