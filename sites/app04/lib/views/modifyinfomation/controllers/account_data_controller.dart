import 'package:aone_common/common.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../app_service.dart';

class AccountDataController extends GetxController {
  final _userState = UserService.to.state;
  final app = AppService.to;
  var dataList = [
    Tuple2('基本信息', [
      AccountListModel('用户名'.tr, '', false, 'userName'),
      AccountListModel('QQ', '未设置'.tr, true, 'qq'),
      AccountListModel('微信'.tr, '', true, 'wechat'),
      AccountListModel('手机'.tr, '绑定请联系'.tr, false, 'phone')
    ]),
    Tuple2('安全信息', [
      AccountListModel('修改登录密码'.tr, '修改'.tr, true, 'loginPassword'),
      AccountListModel('修改取款密码'.tr, '未设置'.tr, true, 'fundPassword'),
      AccountListModel('安全问题'.tr, '请联系'.tr, false, 'safeQuestion'),
      AccountListModel('安全提示'.tr, '请联系'.tr, false, 'safeTip'),
      AccountListModel('安全问题回答'.tr, '请联系'.tr, false, 'safeAnswer'),
    ])
  ];

  @override
  void onInit() {
    super.onInit();
    AccountListModel usernameModel = dataList[0].item2[0];
    usernameModel.content = _userState.userName;
    AccountListModel qqModel = dataList[0].item2[1];
    qqModel.content = _userState.qq == "0" ? '未设置'.tr : "修改".tr;
    AccountListModel wechatModel = dataList[0].item2[2];
    wechatModel.content = _userState.wechat == "0" ? '未设置'.tr : "修改".tr;
    AccountListModel phoneModel = dataList[0].item2[3];
    phoneModel.content = _userState.phone == "0" ? '请联系'.tr : "请联系".tr;

    AccountListModel qkpwdModel = dataList[1].item2[1];
    qkpwdModel.content = _userState.qkpass ? "修改".tr : '未设置'.tr;
    AccountListModel regWenModel = dataList[1].item2[2];
    regWenModel.content = _userState.regQuestion == "0" ? '请联系'.tr : "请联系".tr;
    AccountListModel regTModel = dataList[1].item2[3];
    regTModel.content = _userState.regWenT.isEmpty ? '请联系'.tr : "请联系".tr;
    AccountListModel regDModel = dataList[1].item2[4];
    regDModel.content = _userState.regAnser.isEmpty ? '请联系'.tr : "请联系".tr;

    print(
        '问题提示 == ${_userState.regWenT} --- ${_userState.regAnser} ++ ${_userState.regQuestion}');
  }

  void itemClickWithTag(AccountListModel listModel, int index) {
    if (index == 0 || index == 3) {
      return;
    } else if ([1, 2].contains(index)) {
      Get.toNamed(Routes.accountDataModify, arguments: listModel.keyWord);
    } else if ([10, 11].contains(index)) {
      Get.toNamed(Routes.loginPwdSet, arguments: listModel.keyWord);
    }
    print('点击了：$index');
  }
}

class AccountListModel {
  var title = '';
  var content = '';
  var showContent = true;
  var keyWord = '';

  AccountListModel(this.title, this.content, this.showContent, this.keyWord);
}
