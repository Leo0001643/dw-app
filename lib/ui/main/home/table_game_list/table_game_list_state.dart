import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/ds_game_entity.dart';
import 'package:leisure_games/ui/bean/ele_game_type_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

class TableGameListState {
  TableGameListState() {
    ///Initialize variables
  }

  var searchWord = "".obs;

  var title = "".obs;

  ///全部的棋牌商
  List<GameKindGameKindList>? kindList;

  ///当前选择的棋牌商
  GameKindGameKindList? current;

  ///分类列表
  var typeList = RxList<EleGameTypeEntity>.empty(growable: true);
  // var tabIndex = 0;
  var tabLength = 0.obs;


  ///全部的电子列表
  var allList = DsGameEntity();
  ///正在显示的
  var list = RxList<DsGameGamesZm>.empty(growable: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();



}
