import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetLoginPwdState {
  SetLoginPwdState() {
    ///Initialize variables
  }


  var pwdVisible = false.obs;
  var pwdValue = "";

  var pwdNewVisible = false.obs;
  var pwdNewValue = "";

  var pwdNew1Visible = false.obs;
  var pwdNew1Value = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
