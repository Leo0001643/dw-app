part of 'task_center_logic.dart';

class TaskProgressState<T extends TaskCenterLogic> {
  late String labelText;
  late LabelColor labelColor;
  late String buttonText;
  late void Function()? btnEvent;

  ///是否是普通按钮，普通的按钮有颜色，非普通的为灰色
  bool? isNormalButton;

  ///是否显示操作按钮
  bool? isShowButton;

  ///是否显示进度条
  bool? isShowProcess;

  ///整个card点击是否显示详情
  bool? isShowDetailDialog;

  TaskProgressState({
    required this.labelColor,
    required this.buttonText,
    required this.labelText,
    this.btnEvent,
    this.isNormalButton = false,
    this.isShowButton = false,
    this.isShowProcess = false,
    this.isShowDetailDialog = false,
  });

  factory TaskProgressState.create(
    ProgressCardItem cardItem, {
    required VoidCallback toCustomerService,
    required VoidCallback toHome,
    required VoidCallback toDeposit,
  }) {
    switch (cardItem.state) {
      case 0:
        {
          if (cardItem.needJoin != true) {
            //免申请
            return TaskProgressState<T>(
              labelText: 'task.center.notparticipate', //未参与
              buttonText: 'task.center.tocomplete', //前去完成
              labelColor: LabelColor.gray,
              isNormalButton: true,
              isShowButton: true,
              isShowProcess: false,
              isShowDetailDialog: false,
              btnEvent: () {
                final controller = Get.find<T>();
                controller.noNeetapplyTask(cardItem.joinCond!);
              },
            );
          } else {
            //未参与
            return TaskProgressState<T>(
              labelText: 'task.center.notparticipate', //未参与
              buttonText: 'task.center.applyparticipate', //申请参与
              labelColor: LabelColor.gray,
              isNormalButton: true,
              isShowProcess: false,
              isShowButton: true,
              isShowDetailDialog: false,
              btnEvent: () {
                final controller = Get.find<T>();
                controller.applyTask(cardItem.activityId);
              },
            );
          }
        }

      case 1:
        //审核中
        //不显示操作的button
        return TaskProgressState(
          labelText: 'task.center.underreview',
          buttonText: 'task.center.applyparticipate', //申请参与
          labelColor: LabelColor.purple,
          isNormalButton: true,
          isShowProcess: false,
          isShowButton: false,
          isShowDetailDialog: false,
          btnEvent: () {
            SmartDialog.showToast('task.center.underreviewback'.tr);
          },
        );
      case 3:
        //未通过
        // 显示灰色按钮
        return TaskProgressState(
          labelText: 'task.center.fail',
          buttonText: 'task.center.contactservice', //联系客服
          labelColor: LabelColor.gray,
          isNormalButton: false,
          isShowProcess: false,
          isShowButton: true,
          isShowDetailDialog: false,
          btnEvent: toCustomerService,
        );
    }

    switch (cardItem.paicaiState) {
      case 1:
        //任务完成
        return TaskProgressState(
          labelColor: LabelColor.purple,
          buttonText: 'task.center.taskcomplete', //任务完成
          labelText: 'task.center.underreview',
          isNormalButton: false,
          isShowProcess: true,
          isShowButton: true,
          isShowDetailDialog: true,
          btnEvent: () {
            SmartDialog.showToast('task.center.underreviewback'.tr);
          },
        );
      case 2:
        //任务完成
        return TaskProgressState(
          labelColor: LabelColor.red,
          buttonText: 'task.center.taskcomplete', //任务完成
          labelText: 'task.center.unclaimed',
          isNormalButton: false,
          isShowProcess: true,
          isShowButton: true,
          isShowDetailDialog: true,
          btnEvent: () {
            Get.toNamed(Routes.welfareCenter);
          },
        );
      case 3:
        //任务完成
        return TaskProgressState(
          labelColor: LabelColor.red,
          isNormalButton: false,
          isShowProcess: true,
          isShowButton: true,
          isShowDetailDialog: true,
          buttonText: 'task.center.taskcomplete', //任务完成
          labelText: 'task.center.dispatched',
        );
      case 4:
        //联系客服
        return TaskProgressState(
          labelColor: LabelColor.gray,
          buttonText: 'task.center.contactservice', //联系客服
          labelText: 'task.center.outtime',
          isShowProcess: false,
          isNormalButton: false,
          isShowButton: true,
          isShowDetailDialog: false,
          btnEvent: toCustomerService,
        );
      case 5:
        //联系客服
        return TaskProgressState(
          labelColor: LabelColor.gray,
          buttonText: 'task.center.contactservice', //联系客服
          labelText: 'task.center.fail',
          isNormalButton: false,
          isShowProcess: false,
          isShowButton: true,
          isShowDetailDialog: false,
          btnEvent: toCustomerService,
        );
      default: // default = 0
        bool isDone = cardItem.progressDetail.taskProgress.percent == 100.0;

        return TaskProgressState(
          labelColor: LabelColor.blue,
          //任务完成   前去完成
          buttonText:
              isDone ? 'task.center.taskcomplete' : 'task.center.tocomplete',
          labelText: isDone
              ? 'task.center.participating'
              : 'task.center.participating',
          isNormalButton: !isDone,
          isShowProcess: isDone ? true : true,
          isShowButton: isDone ? true : true,
          isShowDetailDialog: true,
          btnEvent: () {
            if (!isDone) {
              // cardItem.conditions.contains('1') ? toHome() : toDeposit();
              cardItem.conditions.contains('1') ? toDeposit() : toHome();
            }
          },
        );
    }
  }
}
