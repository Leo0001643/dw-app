import 'package:aone_common/controllers/welfare_center/welfare_center_state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class PreferentialController extends BaseController {
  WelfareCenterState state = WelfareCenterState();
  ActivityProvider provider = ActivityProvider();
  final RxDouble _activityAmount = 0.0.obs;
  double get activityAmount => _activityAmount.value;
  set activityAmount(double val) => _activityAmount.value = val;

  Future<void> getRebateAmount() async {
    fetchHandler<FsMoneyEntity>(provider.rebateAmount(), loading: true,
        onSuccess: (res) {
      state.rebateAmount = double.tryParse(res.unReceive!);
      update();
    });
  }

  Future<void> getCollectableRewardAmount() async {
    fetchHandler<ActivityRewardEntity>(
      provider.activityRewardList(1),
      onSuccess: (res) {
        activityAmount = res.award ?? 0.0;
        WelfareCenterLogic.to.state.setRewardList = res.list;
        printInfo(
            info:
              "----> state.setRewardList  state.getRewardList  ${state.getRewardList.hashCode}   ${state.getRewardList.length}");
        WelfareCenterLogic.to.state.activityAmount = res.award ?? 0.0;
        print('接口返回 == ${res.award}');
        print('赋值后 == ${WelfareCenterLogic.to.state.activityAmount}');

        update();
      },
    );
  }

  Future<void> collectReward() async {
    if (activityAmount > 0.0) {
      await fetchHandler(
        provider.collectActivityReward(
          YhRecieveDto(
            all: 1,
            id: 0,
          ),
        ),
        onSuccess: (_) async {
          SmartDialog.showToast('领取成功');
          await getCollectableRewardAmount();
        },
      );
    } else {
      SmartDialog.showToast('暂无可领奖金');
    }
  }

  Future<void> collectRewardById(int id) async {
    printInfo(info: "----->点击 ${state.activityAmount}");
    if (activityAmount > 0.0) {
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
      getCollectableRewardAmount();
      SmartDialog.showToast('暂无可领奖金');
      update();
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
