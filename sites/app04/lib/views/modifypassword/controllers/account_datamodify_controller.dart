import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class AccountDataModifyController extends ChangeUserinfoLogic  {
  final TextEditingController inputController = TextEditingController();

  String _title = "";
  String get title => _title;
  set title(value) {
    _title = value;
  }

  String _label = "";
  String get label => _label;
  set label(String value) {
    _label = value;
  }

  String _hintText = "";
  String get hintText => _hintText;
  set hintText(String value) {
    _hintText = value;
  }

  String _keyword = "";
  String get keyword => _keyword;
  set keyword(String value) {
    _keyword = value;
  }

  final UserService _userService = UserService.to;
  final _userState = UserService.to.state;
  final UserInfoProvider provider = UserInfoProvider();

  String? _regWenValue = "";
  String? get regWenValue => _regWenValue;
  set regWenValue(String? value) {
    _regWenValue = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    _keyword = Get.arguments;
    if(_keyword == "qq"){
      _title = "QQ号码".tr;
      _label = "QQ号码".tr;
      _hintText = "请输入QQ号码".tr;
      inputController.text = _userState.userInfo.regQq! == "0"?"":_userState.userInfo.regQq!;
    }else if(_keyword == "wechat"){
      _title = "微信号码".tr;
      _label = "微信号码".tr;
      _hintText = "请输入微信号码".tr;
      inputController.text = _userState.userInfo.regWeixin! == "0"?"":_userState.userInfo.regWeixin!;
    }else if(_keyword == "safeQuestion"){
      _title = "安全问题".tr;
      _label = "安全问题".tr;
      _hintText = "请选择安全问题".tr;
      // inputController.text = _userState.userInfo!.regWen! == "0"?"":_userState.userInfo!.regWen!;
    }else if(_keyword == "safeTip"){
      _title = "安全提示".tr;
      _label = "安全提示".tr;
      _hintText = "请输入安全提示".tr;
      inputController.text = _userState.userInfo.regWenT! == "0"?"":_userState.userInfo.regWenT!;
    }else if(_keyword == "safeAnswer"){
      _title = "安全问题回答".tr;
      _label = "安全问题回答".tr;
      _hintText = "请输入安全问题回答".tr;
      inputController.text = _userState.userInfo.regWenD! == "0"?"":_userState.userInfo.regWenD!;
    }
    _regWenValue = _userState.regQuestion;
    update();
    super.onReady();
  }


  void onSelectClose(String value) {
    _regWenValue = value;
  }

  Future<void> postData() async {
    if(_keyword != "safeQuestion"){
      if(inputController.text == ""){
        SmartDialog.showToast(_hintText);
        return;
      }
    }
    final HandleUserinfoDto dto = new HandleUserinfoDto();
    if(_keyword == "qq"){
      dto.regQq = inputController.text;
      dto.regWeixin = _userState.wechat=='0'?'':_userState.wechat;
      dto.regWend = _userState.regAnser;
      dto.regWent = _userState.regWenT;
    }else if(_keyword == "wechat"){
      dto.regWeixin = inputController.text;
      dto.regQq = _userState.qq=='0'?'':_userState.qq;
      dto.regWend = _userState.regAnser;
      dto.regWent = _userState.regWenT;
    }else if(_keyword == "safeTip"){
      dto.regWend = inputController.text;
      dto.regQq = _userState.qq=='0'?'':_userState.qq;
      dto.regWeixin = _userState.wechat=='0'?'':_userState.wechat;
      dto.regWent = _userState.regWenT;
    }else if(_keyword == "safeAnswer"){
      dto.regWent = inputController.text;
      dto.regQq = _userState.qq=='0'?'':_userState.qq;
      dto.regWeixin = _userState.wechat=='0'?'':_userState.wechat;
      dto.regWend = _userState.regAnser;
    }
    if(_keyword == "safeQuestion"){
      if(_userState.userInfo.regWen! == _regWenValue||_regWenValue == ""){
        SmartDialog.showToast(_hintText);
        return;
      }
      dto.regWent = _userState.regWenT;
      dto.regQq = _userState.qq;
      dto.regWeixin = _userState.wechat;
      dto.regWend = _userState.regAnser;
      dto.regWen = regWenValue;
    }else{
      dto.regWen = _userState.regQuestion;
    }
    dto.userName = _userState.userName;
    dto.userId = _userState.userId.toString();
    dto.regPhone = _userState.phone;
    dto.regMobilecode = '';
    print("DTO is ${dto.toJson().toString()}" );
    startLoading();
    await fetchHandler(
      provider.updateUserInfo(dto),
      onSuccess: (res) {
        SmartDialog.showToast('user.center.pwd.success'.tr);
        _userService.getUserMoney();
        stopLoading();
        Get.back();
      },
      onError: (err) {
        SmartDialog.showToast(err.message);
      },
    );
  }

}
