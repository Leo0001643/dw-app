import 'package:aone_common/data/model/entities/activity/activity_reward_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelfareCenterState {

  final RxDouble _rebateAmount = 0.0.obs;
  double get rebateAmount => _rebateAmount.value;
  set rebateAmount(val) => _rebateAmount.value = val;


  final RxDouble _activityAmount = 0.0.obs;
  double get activityAmount => _activityAmount.value;
  set activityAmount(double val) => _activityAmount.value = val;

  List<ActivityRewardList> _rewardList = [];
  List<ActivityRewardList> get getRewardList => _rewardList;
  set setRewardList(val) => _rewardList = val;

}