import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';

import '../../../bean/pc28_lotto_entity.dart';
import '../../../bean/pc28_plan_entity.dart';

class TextTimerState {
  TextTimerState() {
    ///Initialize variables
  }

  var text_timer = "等待开盘".obs; //倒计时显示
}
