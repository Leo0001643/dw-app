import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/chess_info_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

class ChessGameListState {
  ChessGameListState() {
    ///Initialize variables
  }

  var searchWord = "".obs;

  var title = "".obs;

  ///全部的棋牌商
  List<GameKindGameKindList>? kindList;

  ///当前选择的棋牌商
  GameKindGameKindList? current;

  ///全部的棋牌列表
  var allList = List<ChessInfoEntity>.empty(growable: true);
  ///正在显示的
  var list = RxList<ChessInfoEntity>.empty(growable: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
