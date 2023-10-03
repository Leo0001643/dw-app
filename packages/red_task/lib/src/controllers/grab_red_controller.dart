import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:red_task/src/controllers/controllers.dart';
import 'package:red_task/src/dto/dto.dart';
import 'package:red_task/src/entities/entities.dart';
import 'package:red_task/src/provider.dart';

class GrabRedController extends BaseController {
  static GrabRedController get to => Get.find();

  final RedTaskProvider provider = RedTaskProvider();

  final RedTaskItem item;
  final RedTaskCycle cycle;

  GrabRedController({required this.item, required this.cycle});

  late final PageController pageController;

  final Rx<RedTaskGrabEntity> _redResult = Rx(RedTaskGrabEntity());

  RedTaskGrabEntity get redResult => _redResult.value;

  set redResult(val) => _redResult.value = val;

  final RxString _rewardAmount = ''.obs;

  String get rewardAmount => _rewardAmount.value;

  set rewardAmount(val) => _rewardAmount.value = val;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: item.status == 3 ? 0 : 1);
  }

  Future<void> grabRed() async {
    var grabWay = RedPageController.to.currentPeriod;
    await fetchHandler<RedTaskGrabEntity>(
        provider.grabRed(
          RedTaskGrabDto(
            itemId: item.itemId,
            id: item.id,
            cid: cycle.cid,
            offset: cycle.offset,
            stime: cycle.stime,
            etime: cycle.etime,
            grabWay: grabWay,
          ),
        ), onSuccess: (res) {
      switch (res.isOk!) {
        case 202:
          pageController.jumpToPage(0);
          break;
        default:
          try {
            rewardAmount = NumberFormat('###.##')
                .format(double.parse(res.message.toString()));
            RedPageController.to;
            pageController.jumpToPage(2);
          } catch (error) {
            print(error);
            SmartDialog.showToast(res.message);
          }
          break;
      }
    });
  }
}
