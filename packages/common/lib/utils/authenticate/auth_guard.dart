

import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// 认证守卫 根据目前用户类型调用回掉
void authGuard(VoidCallback onSuccess, { VoidCallback? trail }) {
  final authLevel = UserService.to.state.authLevel;
  switch (authLevel) {
    case AuthLevel.regular:
      onSuccess();
      break;
    case AuthLevel.trial:
      if (trail != null) {
        trail();
      } else {
        SmartDialog.showToast('请登录正式账号');
        EventBus.emit(EventType.onAuthRequire);
      }
      break;
    default:
      EventBus.emit(EventType.onAuthRequire);
      break;
  }
}


T authGuardValue<T>({required T regular, required T visitor  }) {
  final authLevel = UserService.to.state.authLevel;
  switch (authLevel) {
    case AuthLevel.regular:
    case AuthLevel.trial:
      return regular;
    default:
      return visitor;
  }
}

T authGuardValueZ01<T>({required T regular, required T visitor,required T trial   }) {
  final authLevel = UserService.to.state.authLevel;
  switch (authLevel) {

    case AuthLevel.trial:
      return trial;
    case AuthLevel.regular:
      return regular;
    default:
      return visitor;
  }
}