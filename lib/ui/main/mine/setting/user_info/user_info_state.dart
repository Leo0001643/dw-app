import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/user_detail_entity.dart';

class UserInfoState {
  UserInfoState() {
    ///Initialize variables
  }

  ///用户详情
  var userDetail = UserDetailEntity().obs;

  ///编辑的用户信息
  var userEdit = UserDetailEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
