import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/welfare_center/welfare_center_state.dart';
import 'package:aone_common/data/model/entities/activity/activity_redpacket.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class WelfareCenterLogic extends BaseController {
  static WelfareCenterLogic get to => Get.find();
  WelfareCenterState state = WelfareCenterState();

  ActivityProvider provider = ActivityProvider();

  //返水金额
  Future<void> getRebateAmount() async {
    fetchHandler<FsMoneyEntity>(provider.rebateAmount(), loading: true,
        onSuccess: (res) {
      state.rebateAmount = double.tryParse(res.unReceive!);
      WelfareCenterLogic.to.state.rebateAmount =
          double.tryParse(res.unReceive!);
    });
  }

  //优惠金额
  Future<void> getCollectableRewardAmount() async {
    fetchHandler<ActivityRewardEntity>(
      provider.activityRewardList(1),
      onSuccess: (res) {
        state.setRewardList = res.list;
        state.activityAmount = res.award ?? 0.0;
        WelfareCenterLogic.to.state.setRewardList = res.list;
        WelfareCenterLogic.to.state.activityAmount = res.award ?? 0.0;
        update();
      },
    );
  }

  Future<void> collectReward() async {
    if (state.activityAmount > 0.0) {
      await fetchHandler(
          provider.collectActivityReward(
            YhRecieveDto(
              all: 1,
              id: 0,
            ),
          ), onSuccess: (_) async {
        SmartDialog.showToast('领取成功');
        await getCollectableRewardAmount();
        await getRebateAmount();
      });
    } else {
      SmartDialog.showToast('暂无可领奖金');
    }
  }

  Future<void> judgeCanGetHb(Function callback) async {
    await fetchHandler<ActivityRedpacket>(provider.canGetHongbao(),
        onSuccess: (res) async {
      ActivityRedpacket redpacket = res;
      callback(redpacket);
    });
  }

  Future<void> collectRewardById(int id) async {
    if (state.activityAmount > 0.0) {
      await fetchHandler(
          provider.collectActivityReward(
            YhRecieveDto(
              all: 0,
              id: id,
            ),
          ), onSuccess: (_) {
        SmartDialog.showToast('领取成功');
        getRebateAmount();
        getCollectableRewardAmount();
      });
    } else {
      SmartDialog.showToast('暂无可领奖金');
    }
  }

  Future<void> collectRebate() async {
    if (state.rebateAmount > 0.0) {
      await fetchHandler<HandleFsEntity>(
        provider.collectRebate(),
        onSuccess: (res) {
          SmartDialog.showToast(res.items!);
          getRebateAmount();
        },
      );
    } else {
      SmartDialog.showToast('暂无可领返水');
    }
  }

  @override
  void onInit() async {
    await getCollectableRewardAmount();
    await getRebateAmount();
    super.onInit();
  }
}
