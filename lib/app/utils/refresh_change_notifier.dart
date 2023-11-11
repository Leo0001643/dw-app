import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum RefreshEnum { init,startLoading, refreshCompleted, loadComplete, loadNoData, loadFailed,}


class RefreshChangeNotifier extends ChangeNotifier{

  var value = RefreshEnum.init;

  void startLoading(){
    value = RefreshEnum.startLoading;
    notifyListeners();
  }

  ///刷新完成
  void refreshCompleted(){
    value = RefreshEnum.refreshCompleted;
    notifyListeners();
  }

  ///加载完成
  void loadComplete(){
    value = RefreshEnum.loadComplete;
    notifyListeners();
  }

  ///加载完成没有更多数据
  void loadNoData(){
    value = RefreshEnum.loadNoData;
    notifyListeners();
  }

  ///加载失败
  void loadFailed(){
    value = RefreshEnum.loadFailed;
    notifyListeners();
  }


  /// 数据加载
  static void loadData(bool refresh,RefreshChangeNotifier notifier,RxList rxList,List? list) {
    if(refresh){
      if(list!=null){ rxList.assignAll(list); }
      notifier.refreshCompleted();
    }else {
      if(list!=null){ rxList.addAll(list); }
      notifier.loadComplete();
    }
    ///处理数据
    if(isEmpty(list) || list!.length < Constants.pageSize){
      notifier.loadNoData();
    }
  }


  /// 完成加载
  static void dataComplete(RefreshController controller,RefreshEnum status) {
    if(status == RefreshEnum.refreshCompleted){
      controller.refreshCompleted(resetFooterState: true);
    }else if(status == RefreshEnum.loadComplete){
      controller.loadComplete();
    } else if(status == RefreshEnum.loadNoData){
      controller.loadNoData();
    } else if(status == RefreshEnum.loadFailed){
      controller.loadFailed();
    }else {
      logger("其他未识别状态${status}");
    }
  }

}