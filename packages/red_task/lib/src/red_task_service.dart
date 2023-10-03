import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_task/src/entities/red_rain_info.dart';
import 'package:red_task/src/provider.dart';
import 'package:red_task/src/widgets/join_popup.dart';
import 'package:red_task/src/widgets/red_rain_popup.dart';

import 'entities/entities.dart';

class RedTaskService extends BaseService {
  static RedTaskService get to => Get.find();

  final RedTaskProvider provider = RedTaskProvider();
  final RedRainProvider rainProvider = RedRainProvider();

  //第几级页面
  late int numberPage = 1;

  /// 版面方向
  late final Orientation orientation;

  ///红包类型
  late int redType = 1;   //1 任务红包   2 红包雨

  late int showType = 1;  //版面类型   1:常规版面  2:z01新版面

  /// 打开在线客服
  late final VoidCallback onOpenCS;
  late final VoidCallback toRedTaskPage;
  late final VoidCallback? toDeposit;
  late final VoidCallback? toHome; //横版
  // late final VoidCallback? porteaiToHome; //竖版回首页

  final Rx<RedTaskInfoEntity> _redTaskInfo = Rx(RedTaskInfoEntity());
  RedTaskInfoEntity get redTaskInfo => _redTaskInfo.value;
  set redTaskInfo(value) => _redTaskInfo.value = value;

  final RxBool _showThumbnail = false.obs;
  bool get showThumbnail => _showThumbnail.value;
  set showThumbnail(value) => _showThumbnail.value = value;

  final RxBool _canJoin = false.obs;
  bool get canJoin => _canJoin.value;
  set canJoin(bool val) => _canJoin.value = val;
  

  Future<RedTaskService> init({
    required Orientation orientation,
    int? redType,
    int? showType,
    required VoidCallback onOpenCS,
    required VoidCallback toRedTaskPage,
    VoidCallback? toHome,
    VoidCallback? toDeposit,
  }) async {
    
    this.orientation = orientation;
    this.onOpenCS = onOpenCS;
    this.toRedTaskPage = toRedTaskPage;
    this.redType = redType ?? 1;
    this.showType = showType ?? 1;
    this.toHome = toHome ??= () {
      print('方向 == ${orientation}');
      if (orientation == Orientation.portrait) {
        EventBus.emit(EventType.onTohome, arg: numberPage);
      } else {
        Get.back();
      }
    };

    this.toDeposit = toDeposit;

    if (UserService.to.state.isRegularUser) {

      if(redType == 2)
      {
       await getRedRainInfo();
      }else{
        await getRedTaskInfo();
      }
    }
    EventBus.on(EventType.onLogin, (arg) async {

      if(redType == 2)
      {
       await getRedRainInfo();
      }else{
        await getRedTaskInfo();
      }
    });
    EventBus.on(EventType.onLogout, (arg) => onLogout());
    return this;
  }

  void onLogout() {
    redTaskInfo = RedTaskInfoEntity();
    showThumbnail = false;
  }
  
  //红包雨
   Future<void> getRedRainInfo() async {
    await fetchHandler<RedTaskInfoEntity>(rainProvider.redRainInfo(),
        onSuccess: (res) {

      if (res.id != 0) {
        redTaskInfo = res;
        redTaskInfo.weizhi = 4;
        redTaskInfo.jiaotu =  '0'; 
        redTaskInfo.img = redTaskInfo.img ?? '';
        redTaskInfo.jiaotu = redTaskInfo.jiaotu ?? '0';
        showThumbnail = res.isShow == 1;
        canJoin = res.isShow == 1;

      }
    });
  }

  //任务红包
  Future<void> getRedTaskInfo() async {
    await fetchHandler<RedTaskInfoEntity>(provider.redTaskInfo(),
        onSuccess: (res) {
       print('id == ${res.id}');
       print('isShow == ${res.isShow}');
       print('weizhi == ${res.weizhi}');

      if (res.id != 0) {
        redTaskInfo = res;
        showThumbnail = res.isShow == 1;
        canJoin = res.isShow == 1;
      }
    });
  }

  Future<bool> onEntryRedTask() async {
    
    print('红包类型 == ${redType}');
     if(redType == 2)
     {
      await judgeCanGetHb((res) async{
          Get.dialog(ActivityRedDialog(redRainEntity: res,));
      });
      return true;

     }else{
    print('进入了RedTask');
    if (!UserService.to.state.isRegularUser) {
      EventBus.emit(EventType.onAuthRequire);
      return false;
    }
    print('redTaskInfo.id == ${redTaskInfo.id}');
    if (redTaskInfo.id == null) {
      EventBus.emit(EventType.onActivityInvalid);
      return false;
    }
    if (canJoin) {
      Get.dialog(const RedJoinPopup());
      return false;
    }
    final res = await fetchHandler<CheckQualificationEntity>(
      provider.checkRedValid(),
    );
    if (res?.info!.checkHb != 1) {
      EventBus.emit(EventType.onActivityInvalid);
      return false;
    }
    toRedTaskPage();
    return true;
     }
   
  }

  Future<void> judgeCanGetHb(Function callback) async {
      await fetchHandler<RedRainEntity>(
          rainProvider.canGetHongbao(),
          onSuccess: (res) async {
            RedRainEntity redpacket = res;
            callback(redpacket);
          }
      );
  }

  @override
  void onClose() {
    EventBus.off(EventType.onLogin, (arg) => getRedTaskInfo());
    super.onClose();
  }
}
