import 'package:aone_common/controllers/mine/change_password/change_password_state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../common.dart';

class ChangeasswordLogic extends BaseController {
  ChangePasswordState state = ChangePasswordState();
  final UserInfoProvider provider = UserInfoProvider();

  // var selIndex = 0;
  Future<void> postChangeData(int selIndex) async {
    if (selIndex == 0) {
      await postChangePasswordData();
    } else {
      await changeWithdrawPassword();
    }
  }

  Future<void> postChangePasswordData() async {
    state.passwordFormKey.currentState!.save();
    var dto =
        ChangePasswordDto.fromJson(state.passwordFormKey.currentState!.value);
    dto.passwordTwo =
        state.passwordFormKey.currentState!.fields['password']!.value;
    await fetchHandler(
      provider.updateLoginPwd(dto),
      onSuccess: (res) {
        SmartDialog.showToast('user.center.pwd.success'.tr);
        state.passwordFormKey.currentState!.reset();
        UserService.to.onBeforeLogout();
      },
      onError: (err) {
        SmartDialog.showToast(err.message);
      },
    );
  }

  Future<void> changeWithdrawPassword() async {
    state.withdrawFormKey.currentState!.save();
    var dto = ChangeQKPasswordDto.fromJson(
      state.withdrawFormKey.currentState!.value,
    );
    await fetchHandler(
      provider.updateWithdrawPwd(dto),
      onSuccess: (res) {
        state.withdrawFormKey.currentState!.reset();
        SmartDialog.showToast('user.center.pwd.success'.tr);
      },
      onError: (err) {
        SmartDialog.showToast(err.message);
      },
    );
  }
}
