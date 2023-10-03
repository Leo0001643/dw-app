import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class GenYouhuiCenterController extends WelfareCenterLogic {
  static GenYouhuiCenterController get to => Get.find();

  final RxBool _isShow = false.obs;

  void clickItem(int index) async {
    EventBus.emit(EventType.onYouhuiCenterItemClick, arg: index);
    // switch (index) {
    //   case 0:
    //     {
    //       // RedTaskService.to.numberPage = 1;
    //       // RedTaskService.to.onEntryRedTask();
    //     }
    //     break;
    //   case 1:
    //     {
    //       //每日签到
    //       var sininConfigInfo = await sinin_logic.getSininConfigInfo();
    //       if (sininConfigInfo?.trueQd == 1) {
    //         Get.toNamed(Routes.signCenter);
    //       } else if (sininConfigInfo?.trueQd == 0) {
    //         EventBus.emit(EventType.onActivityInvalid);
    //       }
    //     }
    //     break;
    //   case 2:
    //     {
    //       //大转盘
    //       // Get.put(
    //       //   FortuneWheelService(
    //       //     // 回调为自行实现的widget；
    //       //     // b17测试要求，大转盘铺满,背景图不留safeArea
    //       //     toFortuneWheelPage: () =>
    //       //         Get.dialog(const FortuneWheelPage(), useSafeArea: false),
    //       //     openCS: () {
    //       //       AppService.to.toCustomerService();
    //       //     },
    //       //   ),
    //       // );
    //       //
    //       // FortuneWheelService.to.onBeforeEntry();
    //     }
    //     break;
    //   case 3:
    //     {
    //       Get.toNamed(Routes.taskCenter);
    //     }
    //     break;
    //   case 4:
    //     {
    //       // MainTabbarController.to.jumpToPage(1);
    //       // Get.back();
    //     }
    //     break;
    //   case 5:
    //     {
    //       // Get.toNamed(Routes.vipCenter);
    //       print('VIP中心');
    //     }
    //     break;
    //   case 6:
    //     {
    //       print('答题闯关');
    //     }
    //     break;
    //   case 7:
    //     {
    //       print('注册即送');
    //     }
    //     break;
    //   case 8:
    //     {
    //       print('热门活动');
    //     }
    //     break;
    //   default:
    //     {}
    // }
  }

  List<ActivityCenterModel> dataList = [
    ActivityCenterModel('activity_centerlist_qhb.png', '抢红包', '已返水', true),
    ActivityCenterModel('activity_centerlist_mrqd.png', '每日签到', '已返水', true),
    ActivityCenterModel('activity_centerlist_dzp.png', '大转盘', '已返水', true),
    ActivityCenterModel('activity_centerlist_rwzx.png', '任务中心', '已领取', true),
    ActivityCenterModel('activity_centerlist_rmhd.png', '热门活动', '已领取', true),
    ActivityCenterModel('activity_centerlist_vip_g.png', '敬请期待', '已返水', true),
    ActivityCenterModel('activity_centerlist_dtcg.png', '敬请期待', '已返水', false),
    ActivityCenterModel('activity_centerlist_zcjs.png', '敬请期待', '已返水', false),
    ActivityCenterModel('activity_centerlist_ckgd.png', '敬请期待', '已返水', false),
  ];
}

class ActivityCenterModel {
  var imagName = '';
  var title = '';
  var detTitle = '';
  var money = true;

  ActivityCenterModel(this.imagName, this.title, this.detTitle, this.money);
}
