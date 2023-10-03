import 'package:aone_common/utils/extension.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

final RegExp _numReg = RegExp(r".*[0-9].*");
final RegExp _letterReg = RegExp(r".*[A-Za-z].*");
final RegExp _specialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

/// 密码强度检查 返回 [0-3]
/// 0 = 空密码
/// 1 = 低
/// 2 = 中
/// 3 = 高
int passwordStrengthChecker(String value) {
  int strength = 0;
  // 大于6位
  if (value.length >= 6) {
    strength++;
  }
  // 含数字及字母 (无论大小写)
  if (value.contains(_numReg) && value.contains(_letterReg)) {
    strength++;
  }
  // 含特殊自负
  if (value.contains(_specialCharacter)) {
    strength++;
  }
  return strength;
}

/// 密码强度检查 返回 [0-3]
/// 0 = 空密码
/// 1 = 低
/// 2 = 中
/// 3 = 高
/// z01特殊的需求要和wap一样,这是wap的代码，稍微翻译了下规则
/// if (key === 'password') {
//         // 这里写正则
//         if (/^[\w~!@#$%^&*?]{6,20}$/.test(value)) {
//           passwordval.first = false;
//         } else {
//           passwordval.first = true;
//         }
//         if (/^[\w~!@#$%^&*?]{11,20}$/.test(value)) {
//           passwordval.ford = false;
//         } else {
//           passwordval.ford = true;
//         }
//         if (/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*?]+)$)^[\w~!@#$%^&*?]/.test(value)) {
//           passwordval.second = false;
//         } else {
//           passwordval.second = true;
//         }
//         if (passwordval.arr.includes(value) || value === '') {
//           passwordval.third = true;
//         } else {
//           passwordval.third = false;
//         }
//         if (value === formValues.user_name || value === '') {
//           passwordval.fived = true;
//         } else {
//           passwordval.fived = false;
//         }
//         if (
//           !passwordval.second &&
//           !passwordval.third &&
//           !passwordval.ford &&
//           !passwordval.fived
//         ) {
//           setCurrentType(pdStrong[2]);
//         } else if (!passwordval.second && value.length > 20) {
//           setCurrentType(pdStrong[2]);
//         } else if (
//           !passwordval.second &&
//           !passwordval.first &&
//           !passwordval.third &&
//           !passwordval.fived
//         ) {
//           setCurrentType(pdStrong[1]);
//         } else {
//           setCurrentType(pdStrong[0]);
//         }
//       }
int passwordStrengthCheckerOther(String value) {
  int strength = 0;
  // 大于6位
  if (value.length >= 6) {
    strength++;
  }
  // 含数字及字母 (无论大小写)
  if (value.contains(_numReg) && value.contains(_letterReg)) {
    strength++;
  }
  // 6-20
  if (value.length >= 11 && value.length <= 20) {
    strength++;
  }
  return strength;
}
