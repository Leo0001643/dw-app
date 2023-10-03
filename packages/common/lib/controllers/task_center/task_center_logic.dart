import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/data/remote/providers/game_provider.dart';
import 'package:aone_common/data/remote/providers/task_center_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

part 'task_center_state.dart';
part 'task_center_interface.dart';
part 'task_center_utils.dart';

class TaskCenterLogic extends BaseController {
  final TaskCenterState state = TaskCenterState();
  final TaskCenterProvider provider = TaskCenterProvider();
  final GameProvider _gameProvider = GameProvider();

  final RxString _activeType = '1'.obs;
  String get activeType => _activeType.value;
  set activeType(value) => _activeType.value = value;

  RxList<ProgressCardItem> filteredList = RxList<ProgressCardItem>([]);

  @override
  Future<void> onInit() async {
    super.onInit();
    startLoading();
    await getAllGameImage();
    await getTaskList();
    stopLoading();
  }

  Future<void> getTaskList() async {
    await fetchHandler<TaskCenterEntity>(provider.taskCenterInfo(),
        onSuccess: (res) {
      List<ProgressCardItem> list = [];
      for (var item in res.items!) {
        for (var process in item.process!) {
          for (var task in process.value!) {
            // var award = item.taskAward!
            //     .firstWhere((element) => element.taskId! == process.taskId!)
            //     .award!;
            list.add(
              ProgressCardItem(
                show: task.show!,
                conditions: process.conds!,
                state: item.state!,
                activityId: item.id!,
                taskId: process.taskId!,
                paicaiState: task.paicaiState!,
                award: task.award!,
                gameType: task.gameType2!,
                gameTag: task.gameTagName2!.split(',').first,
                progressDetail: ProgressDetail(
                    actEndTime: item.etime!,
                    actStartTime: item.stime!,
                    publishEndTime: process.pjTime!.etime!,
                    publishStartTime: process.pjTime!.stime!,
                    taskProgress: task.value!,
                    gameTagName: task.gameTagName),
                cycle: process.cycle!,
                needJoin: item.joinCond!.apply == 1,
                joinCond: item.joinCond!,
                taskTitle: process.title!,
                title: item.title!,
              ),
            );
          }
        }
      }
      state.progressList
        ..clear()
        ..addAll(list);
    });
  }

  Future<void> getAllGameImage() async {
    await fetchHandler<AllGameImageEntities>(_gameProvider.getAllGameImage(),
        onSuccess: (res) {
      state.gameImageList.addAll(res.items ?? []);
    });
  }

  Future noNeetapplyTask(JoinCond joinCond) async {
    TaskCenterApplyEntities applyEntities = TaskCenterApplyEntities();
    applyEntities.message = joinCond.message;
    applyEntities.errCode = joinCond.errCode;
    applyEntities.depositFinish = joinCond.depositFinish;
    applyEntities.deposit = joinCond.deposit;
    applyEntities.dmlFinish = joinCond.dmlFinish;
    applyEntities.dml = joinCond.dml;
    onApplyFailed(applyEntities);
  }

  Future applyTask(int id) async {
    await fetchHandler<TaskCenterApplyEntities>(provider.applyTaskActivity(id),
        onSuccess: (res) {
      if (res.errCode == 0) {
        SmartDialog.showToast('task.center.apply.success'.tr);
        getTaskList();
      } else {
        onApplyFailed(res);
      }
    });
  }

  void onTabClick(String type, [String? condition]) {
    activeType = type;
    filteredList.clear();
    // 区分是游戏类型还是用户财务相关的

    if (int.tryParse(type) == null && condition != null) {
      // 如果是充值 返水类型的话 按照conds 来组装数据
      filteredList.addAll(
        state.progressList.where((el) {
          print('是否需要参加 == ${el.needJoin}');

          print('展示情况 == ${el.show}');
          return el.conditions.contains(condition);
        }),
      );
    } else {
      filteredList.addAll(
        // 游戏只需要展示带有效投注的
        state.progressList.where((el) {
          return (el.gameType.split(',').contains(type) ||
                  el.gameType.split(',').contains('0')) &&
              el.conditions.contains('2');
        }),
      );
    }

    filteredList.removeWhere((el) => !el.show && el.state == 2);

    update();
  }

  double calculateTotal(String userDone, String target) {
    print('userDone == ${userDone}' + 'target == ${target}');
    print('xxx${double.parse(userDone) / double.parse(target) * 100}');
    // return min(
    //   (double.parse(userDone) / double.parse(target) * 100).roundToDouble(),
    //   100,
    // );
    return min(
      (double.parse(userDone) / double.parse(target) * 100),
      100,
    );
  }

  calculateTotalWith(String userDone, String target, int postion) {
    double num = double.parse(userDone) / double.parse(target) * 100;
    if ((userDone == '0') | (userDone == '0.00')) {
      return '0';
    }
    if (num >= 100) {
      return '100';
    }
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return (num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return (num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }

  void onApplyFailed(TaskCenterApplyEntities item) {
    throw UnimplementedError('必须实现此方法');
  }
}
