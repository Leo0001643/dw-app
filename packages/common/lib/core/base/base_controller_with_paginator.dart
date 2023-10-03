import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

/// experimental
abstract class BaseControllerWithPaginator<T> extends BaseController {

  RxList<T> listItem = RxList.empty();

  // 当前页
  final RxInt _currentPage = 1.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int val) => _currentPage.value = val;

  // 最后一页
  final RxInt _total = 9999.obs;
  int get total => _total.value;
  set total(int val) => _total.value = val;

  // 每一页的内容长度
  final RxInt _pageSize = 20.obs;
  int get pageSize => _pageSize.value;
  set pageSize(val) => _pageSize.value = val;

  int get lastPage => (total / pageSize).floor();

  // 还有没有最后一页
  bool get hasMorePage => currentPage < lastPage;

  // 获取当前页内容
  List<T> get currentPageItems {
    return listItem.sublist(
      pageSize - (pageSize * currentPage),
      pageSize * currentPage,
    );
  }

  ScrollController scrollController = ScrollController();

  final debouncer = Debouncer(delay: const Duration(milliseconds: 300));


  @mustCallSuper
  Future<void> onRefresh() async {
    listItem.clear();
    currentPage = 1;
  }

  @mustCallSuper
  Future<void> onLoadNextPage() async {
    if (!hasMorePage) {
      return;
    }
  }

  void appendPage(List<T> item) {
    listItem.addAll(item);
  }
}
