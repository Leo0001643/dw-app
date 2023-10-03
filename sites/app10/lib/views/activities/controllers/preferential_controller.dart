import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/welfare_center/welfare_center_state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class PreferentialController extends BaseController {
  static PreferentialController get to => Get.find();

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
        state.setRewardList = res.list;

        state.activityAmount = res.award ?? 0.0;
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
    if (state.activityAmount > 0.0) {
      await fetchHandler(
          provider.collectActivityReward(
            YhRecieveDto(
              all: 0,
              id: id,
            ),
          ), onSuccess: (_) {
        SmartDialog.showToast('领取成功');
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
