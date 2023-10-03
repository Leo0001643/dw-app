import 'package:aone_common/controllers/mine/change_password/change_password_logic.dart';
import 'package:aone_common/core/base/base_controller.dart';
import 'package:aone_common/data/model/dto/user/password_change.dart';
import 'package:aone_common/data/remote/providers/user_info_provider.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class PasswordModifyController extends BaseController {
  final TextEditingController firstInputController = TextEditingController();
  final TextEditingController secondInputController = TextEditingController();
  final TextEditingController thirdInputController = TextEditingController();

  final _firstInputVisible = true.obs;
  get firstInputVisible => _firstInputVisible.value;
  set firstInputVisible(val) => _firstInputVisible.value = val;

  final _secondInputVisible = true.obs;
  get secondInputVisible => _secondInputVisible.value;
  set secondInputVisible(val) => _secondInputVisible.value = val;

  final _thirdInputVisible = true.obs;
  get thirdInputVisible => _thirdInputVisible.value;
  set thirdInputVisible(val) => _thirdInputVisible.value = val;

  final UserInfoProvider provider = UserInfoProvider();
  final UserService _userService = UserService.to;
  final _userState = UserService.to.state;

  String _title = "修改登录密码".tr;
  String get title => _title;
  set title(value) {
    _title = value;
  }

  String _keyword = "";
  String get keyword => _keyword;
  set keyword(String value) {
    _keyword = value;
  }

  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  set currentIndex(val) => _currentIndex.value = val;
  var pwList = [
    Tuple2('原登录密码'.tr, '请输入原登录密码'.tr),
    Tuple2('新的登录密码'.tr, '6~20位, 至少包含2种不同字符'.tr),
    Tuple2('确认新密码'.tr, '请再次输入新的登录密码'.tr),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    _keyword = Get.arguments;
    if (_keyword == "loginPassword") {
      pwList = [
        Tuple2('原登录密码'.tr, '请输入原登录密码'.tr),
        Tuple2('新的登录密码'.tr, '6~20位, 至少包含2种不同字符'.tr),
        Tuple2('确认新密码'.tr, '两次密码输入必须一致'.tr),
      ];
      _title = "修改登录密码".tr;
    } else if (_keyword == "fundPassword") {
      if (_userState.userInfo.qkpass!) {
        pwList = [
          Tuple2('验证登录密码'.tr, '请输入登录密码'.tr),
          Tuple2('验证取款密码'.tr, '请输入原取款密码'.tr),
          Tuple2('新密码'.tr, '请输入6位数字的取款密码'.tr),
        ];
        _title = "修改取款密码".tr;
      } else {
        pwList = [
          Tuple2('验证登录密码'.tr, '请输入登录密码'.tr),
          Tuple2('取款密码'.tr, '请输入6位数字的取款密码'.tr),
        ];
        _title = "设置取款密码".tr;
      }
    }
    update();
    super.onReady();
  }

  sumit() {
    Tuple2 tuple21 = pwList[0];
    if (firstInputController.text == "") {
      SmartDialog.showToast(tuple21.item2);
      return;
    }
    Tuple2 tuple22 = pwList[1];
    if (secondInputController.text == "") {
      SmartDialog.showToast(tuple22.item2);
      return;
    }

    if (_keyword == "loginPassword" ||
        (_keyword == "fundPassword" && _userState.userInfo.qkpass!)) {
      Tuple2 tuple23 = pwList[2];
      if (thirdInputController.text == "") {
        SmartDialog.showToast(tuple23.item2);
        return;
      }
    }
    if (_keyword == "loginPassword") {
      var dto = new ChangePasswordDto();
      dto.oldpassword = firstInputController.text;
      dto.passwordTwo = secondInputController.text;
      dto.password = thirdInputController.text;
      postChangePasswordData(dto);
    } else {
      var dto = new ChangeQKPasswordDto();
      if (_userState.userInfo.qkpass!) {
        //修改取款密码
        dto.password = firstInputController.text;
        dto.oldqkpass = secondInputController.text;
        dto.qkpass = thirdInputController.text;
      } else {
        //设置取款密码
        dto.password = firstInputController.text;
        dto.qkpass = secondInputController.text;
      }
      changeWithdrawPassword(dto);
    }
  }

  Future<void> postChangePasswordData(ChangePasswordDto dto) async {
    startLoading();
    await fetchHandler(
      provider.updateLoginPwd(dto),
      onSuccess: (res) {
        stopLoading();
        resetInput();
        SmartDialog.showToast('user.center.pwd.success'.tr);
        UserService.to.onBeforeLogout();
      },
      onError: (err) {
        stopLoading();
        SmartDialog.showToast(err.message);
      },
    );
  }

  Future<void> changeWithdrawPassword(ChangeQKPasswordDto dto) async {
    startLoading();
    await fetchHandler(
      provider.updateWithdrawPwd(dto),
      onSuccess: (res) {
        stopLoading();
        resetInput();
        SmartDialog.showToast('user.center.pwd.success'.tr);
      },
      onError: (err) {
        stopLoading();
        SmartDialog.showToast(err.message);
      },
    );
  }

  void resetInput() {
    firstInputController.text = "";
    secondInputController.text = "";
    thirdInputController.text = "";
  }
}
