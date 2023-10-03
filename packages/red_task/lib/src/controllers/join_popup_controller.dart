import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';
import 'package:red_task/src/provider.dart';
import 'package:red_task/src/red_task_service.dart';

import '../entities/entities.dart';

class JoinPopupController extends BaseController {
  static JoinPopupController get to => Get.find();

  final RedTaskService _service = RedTaskService.to;
  final RedTaskProvider provider = RedTaskProvider();

  PageController pageController = PageController(initialPage: 0);

  final RxInt _joinStatus = 0.obs;

  int get joinStatus => _joinStatus.value;

  set joinStatus(value) => _joinStatus.value = value;

  final RxString _depositRequire = ''.obs;

  String get depositRequire => _depositRequire.value;

  set depositRequire(value) => _depositRequire.value = value;

  final RxString _validBetRequire = ''.obs;

  String get validBetRequire => _validBetRequire.value;

  set validBetRequire(value) => _validBetRequire.value = value;

  Future<void> joinActivity() async {
    await fetchHandler<RedTaskJoinEntity>(
      provider.joinRedActivity(_service.redTaskInfo.id!),
      onSuccess: (res) {
        joinStatus = res.isOk;
        int isOk = res.isOk!;
        /// 参与成功
        if (isOk == 200) {
          pageController.jumpToPage(1);
          _service.showThumbnail = false;
          _service.canJoin = false;
          /// 参与条件不满足
        } else if ([202, 203, 204].contains(isOk)) {
          switch (isOk) {
            case 202:
              depositRequire = res.message;
              break;
            case 203:
              validBetRequire = res.message?.replaceAll('|', '');
              break;
            case 204:
              List<String> conditions = res.message!.split('|');
              depositRequire = conditions[0];
              validBetRequire = conditions[1];
              break;
          }
          pageController.jumpToPage(2);
        } else {
          _service.showThumbnail = false;
          pageController.jumpToPage(3);
        }
      },
    );
  }
}
