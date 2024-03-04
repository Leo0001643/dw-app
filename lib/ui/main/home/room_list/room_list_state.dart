import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

class RoomListState {
  RoomListState() {
    ///Initialize variables
  }

  var title = "".obs;

  ///房型选择
  var pc28Lotto = Pc28LottoEntity().obs;
  ///当前房型
  var room = Pc28LottoRooms().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();


}



