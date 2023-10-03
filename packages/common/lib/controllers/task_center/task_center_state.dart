part of 'task_center_logic.dart';

class TaskCenterState {
  final List<TaskCenterSideBarItem> sideBarItems = AppEnv.config.isSports == 1 ? [
    TaskCenterSideBarItem(
      name: 'game.type.4'.tr,
      type: '4',
      gameType: 'sports',
    ),
    TaskCenterSideBarItem(
      name: 'deposit'.tr,
      type: 'deposit',
      gameType: 'deposit',
      condition: '1',
    ),
    TaskCenterSideBarItem(
      name: 'rescue'.tr,
      type: 'rescue',
      gameType: 'rescue',
      condition: '3',
    ),
    TaskCenterSideBarItem(
      name: 'rebate'.tr,
      type: 'rebate',
      gameType: 'rebate',
      condition: '4',
    ),]:[
    TaskCenterSideBarItem(
      name: 'game.type.1'.tr,
      type: '1',
      gameType: 'live',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.2'.tr,
      type: '2',
      gameType: 'egame',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.3'.tr,
      type: '3',
      gameType: 'lottery',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.4'.tr,
      type: '4',
      gameType: 'sports',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.5'.tr,
      type: '5',
      gameType: 'fish',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.6'.tr,
      type: '6',
      gameType: 'chess',
    ),
    TaskCenterSideBarItem(
      name: 'game.type.7'.tr,
      type: '7',
      gameType: 'esports',
    ),
    TaskCenterSideBarItem(
      name: 'deposit'.tr,
      type: 'deposit',
      gameType: 'deposit',
      condition: '1',
    ),
    TaskCenterSideBarItem(
      name: 'rescue'.tr,
      type: 'rescue',
      gameType: 'rescue',
      condition: '3',
    ),
    TaskCenterSideBarItem(
      name: 'rebate'.tr,
      type: 'rebate',
      gameType: 'rebate',
      condition: '4',
    ),
  ];

  final RxList<Process> taskList = RxList<Process>([]);
  final RxList<ProgressCardItem> progressList = RxList<ProgressCardItem>([]);
  final RxList<AllGameImageItem> gameImageList = RxList.empty();
}


