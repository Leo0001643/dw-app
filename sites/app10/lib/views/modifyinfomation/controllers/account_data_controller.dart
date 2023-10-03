import 'package:aone_common/common.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../app_service.dart';

class AccountDataController extends GetxController {
  final _userState = UserService.to.state;
  final app = AppService.to;
  var dataList = [
    Tuple2('基本信息', [
      AccountListModel('账号'.tr, '', false, 'userName',
          assetName: 'setting_item1'),
      AccountListModel('手机号', '绑定'.tr, true, 'phone',
          assetName: 'setting_item2'),
      AccountListModel('QQ', '未设置'.tr, true, 'qq', assetName: 'setting_item3'),
      AccountListModel('微信'.tr, '绑定', true, 'wechat',
          assetName: 'setting_item4'),
      AccountListModel('安全问题'.tr, '未设置'.tr, true, 'safeQuestion',
          assetName: 'setting_item5'),
      AccountListModel('安全问题回答'.tr, '未设置'.tr, true, 'safeAnswer',
          assetName: 'setting_item6'),
      AccountListModel('安全问题提示'.tr, '未设置'.tr, true, 'safeTip',
          assetName: 'setting_item7'),
    ]),
    Tuple2('安全信息', [
      AccountListModel('修改登录密码'.tr, '修改'.tr, true, 'loginPassword',
          assetName: 'setting_item8'),
      AccountListModel('修改取款密码'.tr, '未设置'.tr, true, 'fundPassword',
          assetName: 'setting_item9'),
      AccountListModel('银行卡管理'.tr, '查看'.tr, true, '',
          assetName: 'setting_item10'),
    ])
  ];

  @override
  void onInit() {
    super.onInit();
    getBaseInfo();
    print(
        '问题提示 == ${_userState.regWenT} --- ${_userState.regAnser} ++ ${_userState.regQuestion}');
  }

  Future<void> getBaseInfo() async {
    UserService.to.getUserInfo((data) {
      MoneyInfoEntity entity = data;
      AccountListModel phoneModel = dataList[0].item2[1];
      phoneModel.content =
          _userState.phone == "0" ? '绑定'.tr : (_userState.phone + " ");
      dataList[0].item2[1] = phoneModel;

      AccountListModel qqModel = dataList[0].item2[2];
      qqModel.content = (entity.regQq == "0") ? '未设置'.tr : entity.regQq ?? "";
      dataList[0].item2[2] = qqModel;

      AccountListModel wechatModel = dataList[0].item2[3];
      wechatModel.content =
          entity.regWeixin == "0" ? '未设置'.tr : entity.regWeixin ?? "";
      dataList[0].item2[3] = wechatModel;
      update();
    });

    AccountListModel usernameModel = dataList[0].item2[0];
    usernameModel.content = _userState.userName;
    dataList[0].item2[0] = usernameModel;

    AccountListModel phoneModel = dataList[0].item2[1];
    phoneModel.content =
        _userState.phone == "0" ? '绑定'.tr : (_userState.phone + " ");
    dataList[0].item2[1] = phoneModel;

    AccountListModel qqModel = dataList[0].item2[2];
    qqModel.content = _userState.qq == "0" ? '未设置'.tr : _userState.qq;
    dataList[0].item2[2] = qqModel;

    AccountListModel wechatModel = dataList[0].item2[3];
    wechatModel.content =
        _userState.wechat == "0" ? '未设置'.tr : _userState.wechat;
    dataList[0].item2[3] = wechatModel;

    AccountListModel regWenModel = dataList[0].item2[4];
    regWenModel.content = _userState.regQuestion == "0" ? '未设置'.tr : "查看".tr;

    AccountListModel regDModel = dataList[0].item2[5];
    regDModel.content = _userState.regAnser.isEmpty ? '未设置'.tr : "查看".tr;

    AccountListModel regTModel = dataList[0].item2[6];
    regTModel.content = _userState.regWenT.isEmpty ? '未设置'.tr : "查看".tr;

    AccountListModel qkpwdModel = dataList[1].item2[1];
    qkpwdModel.content = _userState.qkpass ? "修改".tr : '未设置'.tr;
    dataList[1].item2[1] = qkpwdModel;

    update();
  }

  void itemClickWithTag(AccountListModel listModel, int index) {
    if (index == 0) {
      return;
    } else if ([1, 2, 3, 4, 5, 6].contains(index)) {
      toOtherPage(listModel);
    } else if ([7, 8].contains(index)) {
      Get.toNamed(Routes.modifyPasswordPage, arguments: listModel.keyWord);
    } else if ([9].contains(index)) {
      Get.toNamed(Routes.wallet);
    }
  }

  Future<void> toOtherPage(AccountListModel listModel) async {
    var data = await Get.toNamed(Routes.accountDataModify,
        arguments: listModel.keyWord);
    if (data == 'success') {
      getBaseInfo();
    }
  }
}

class AccountListModel {
  var title = '';
  var content = '';
  var showContent = true;
  var keyWord = '';
  var assetName = '';

  AccountListModel(
    this.title,
    this.content,
    this.showContent,
    this.keyWord, {
    this.assetName = '',
  });
}
