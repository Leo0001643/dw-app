import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class ModifyInformationController extends BaseController {
  static ModifyInformationController get to => Get.find();

  TextEditingController inputControllerQQ = TextEditingController();
  TextEditingController inputControllerWeChat = TextEditingController();
  TextEditingController inputControllerPhone = TextEditingController();
  TextEditingController inputControllerSafeTip = TextEditingController();
  TextEditingController inputControllerSafeAnswer = TextEditingController();

  final UserService _userService = UserService.to;
  final _userState = UserService.to.state;
  final UserInfoProvider provider = UserInfoProvider();

  //安全问题
  RxString safeQuestion = RxString("");
  RxString safeTips = RxString("");
  RxString safeAnswer = RxString("");
  RxString safePhone = RxString("");

  selectSafeQuestion(String value) {
    safeQuestion.value = value;
    update();
  }

  final List<String> questionList = [
    '您的出生地是?',
    '您的父亲姓名是?',
    '您的母亲姓名是?',
    '您的配偶姓名是?',
    '您的高中班主任的名字是?',
    '您的初中班主任的名字是?',
    '您的小学班主任的姓名是?',
    '您最新换的一首歌名是?'
  ];
  @override
  void onInit() {
    super.onInit();
    ever(pageStateObs, (state) {
      if (state == PageState.loading) {
        SmartDialog.showLoading();
      } else {
        SmartDialog.dismiss(status: SmartStatus.loading);
      }
    });
  }

  @override
  void onReady() async {
    inputControllerQQ.text = _userState.qq == "0" ? "" : _userState.qq;
    inputControllerWeChat.text =
        _userState.wechat == "0" ? "" : _userState.wechat;
    inputControllerPhone.text = _userState.phone == "0" ? "" : _userState.phone;
    safePhone.value = _userState.phone == "0" ? "" : _userState.phone;
    inputControllerSafeAnswer.text = _userState.regWenT;
    inputControllerSafeTip.text = _userState.regAnser;
    // safeAnswer.value = _userState.regWenT;
    // safeTips.value = _userState.regAnser;
    if (_userState.regQuestion.isNotEmpty && _userState.regQuestion != '0') {
      safeQuestion.value = _userState.regQuestion;
    }
  }

  Future<void> postData() async {
    final HandleUserinfoDto dto = new HandleUserinfoDto();
    var qq = _userState.qq == "0" ? "" : _userState.qq;
    var weixin = _userState.wechat == "0" ? "" : _userState.wechat;
    var phone = _userState.phone == "0" ? "" : _userState.phone;

    dto.regQq = inputControllerQQ.text == "" ? qq : inputControllerQQ.text;
    dto.regWeixin =
        inputControllerWeChat.text == "" ? weixin : inputControllerWeChat.text;
    dto.regPhone =
        inputControllerPhone.text == "" ? phone : inputControllerPhone.text;
    // dto.regWend =  inputControllerSafeTip.text == "" ? _userState.regAnser : inputControllerSafeTip.text;
    // dto.regWent =  inputControllerSafeAnswer.text == "" ? _userState.regWenT : inputControllerSafeAnswer.text;
    // dto.regWen = safeQuestion.value == "请选择安全问题"?"": safeQuestion.value;

    dto.userName = _userState.userName;
    dto.userId = _userState.userId.toString();
    dto.regMobilecode = '';
    print("DTO is ${dto.toJson().toString()}");
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
