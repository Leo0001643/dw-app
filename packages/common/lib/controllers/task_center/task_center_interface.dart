part of 'task_center_logic.dart';

class TaskCenterSideBarItem {
  final String name;
  final String? condition;
  final String type;
  final String gameType;

  TaskCenterSideBarItem({
    required this.name,
    this.condition,
    required this.type,
    required this.gameType,
  });
}

class ProgressCardItem {
  final int state; //0 参与中   1 审核中
  final int activityId;
  final int taskId;
  final String title;
  final String taskTitle;
  final bool needJoin;
  final JoinCond? joinCond;
  final int cycle;
  final int paicaiState;
  final ProgressDetail progressDetail;
  final String award;
  final String gameType;
  final List<String> conditions;
  final bool show;
  final String gameTag;

  ProgressCardItem({
    required this.state,
    required this.activityId,
    required this.taskId,
    required this.progressDetail,
    required this.cycle,
    required this.needJoin,
    required this.joinCond,
    required this.taskTitle,
    required this.title,
    required this.paicaiState,
    required this.award,
    required this.gameType,
    required this.conditions,
    required this.show,
    required this.gameTag,
  });
}

class ProgressDetail {
  final int actStartTime;
  final int actEndTime;
  final int publishStartTime;
  final int publishEndTime;
  final TaskProgress taskProgress;
  final String? gameTagName;
  ProgressDetail(
      {required this.actStartTime,
      required this.actEndTime,
      required this.publishStartTime,
      required this.publishEndTime,
      required this.taskProgress,
      this.gameTagName});
}

enum LabelColor { gray, blue, purple, red }
