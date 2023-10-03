import 'dart:async';
import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/src/logic/dto.dart';
import 'package:get/get.dart';
import '../../fortune_wheel.dart';
import 'entities/entities.dart';
import 'provider.dart';

class FortuneWheelState {
  final RxList<Rewards> rewardList = RxList.empty();
  final RxList<WheelProgress> progressList = RxList.empty();

  final RxInt _available = 0.obs;

  int get available => _available.value;

  set available(int value) => _available.value = value;

  final Rx<WheelPlay> _reward = Rx(WheelPlay());

  WheelPlay get reward => _reward.value;

  set reward(WheelPlay value) => _reward.value = value;

  final RxBool _isDisable = false.obs;

  get isDisable => _isDisable.value;

  set isDisable(value) => _isDisable.value = value;

  final RxString _title = 'fortuneWheel.progress'.obs;

  get title => _title.value;

  set title(value) => _title.value = value;
}

class FortuneWheelLogic extends BaseController {
  static FortuneWheelLogic get to => Get.find();
  final FortuneWheelState state = FortuneWheelState();
  final FortuneWheelProvider provider = FortuneWheelProvider();
  final StreamController<int> streamController = StreamController<int>();


  final FortuneWheelService _service = FortuneWheelService.to;

  Future<void> initWheelState() async {
    await fetchHandler<WheelInfoEntity>(
      provider.wheelInfo(_service.actInfo!.id!),
      onSuccess: (res) {
        state.rewardList
          ..clear()
          ..addAll(res.rewards!);
        state.available = res.available!;
      },
    );
  }

  Future<void> playWheel() async {
    if (state.isDisable) return;
    if (state.available <= 0) {
      SmartDialog.showToast('抽奖机会不足'.tr);
      return;
    }
    state.isDisable = true;
    await fetchHandler<WheelPlay>(
      provider.playWheel(_service.actInfo!.id!),
      onSuccess: (res) {
        if (res.statusCode == 406) {
          SmartDialog.showToast(res.message!);
          state.isDisable = false;
          return;
        }
        state.reward = res;
        int target = state.rewardList.indexWhere(
          (element) => element.id == res.id,
        );
        streamController.add(target);
        WelfareCenterLogic.to.getCollectableRewardAmount();
      },
      onError: (err) => state.isDisable = false,
    );
  }

  Future<void> getProgress() async {
    await fetchHandler<WheelProgressEntity>(
        provider.wheelProgress(_service.actInfo!.id!), onSuccess: (res) {
      state.progressList.addAll(res.data!);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    startLoading();
    await Future.wait([
      getProgress(),
      initWheelState(),
    ]);
    stopLoading();
  }
}
