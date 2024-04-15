// import 'package:flutter/material.dart';
// import 'package:htx/app/error_response_handler.dart';
// import 'package:htx/app/global.dart';
// import 'package:htx/app/network/http_wrapper.dart';
// import 'package:htx/app/utils/sys_utils.dart';
// import 'package:htx/ui/bean/version_info_entity.dart';
// import 'package:ota_update/ota_update.dart';
//
// import 'dialog_utils.dart';
//
// /// 版本管理工具类
class VersionUtils {
  VersionUtils._internal();
//
//   /// 版本检测
//   static void checkVersion(BuildContext context, {bool isAbout = true}) {
//     Map<String, dynamic> params = {};
//     if (isAbout) {
//       params['about'] = 'Y';
//     }
//     HttpWrapper().checkVersion(params).then((value) {
//       if (value.successful) {
//         var entity = value!.data;
//         if (entity is VersionInfoEntity) {
//           if (entity.update == true) {
//             _update(context, entity);
//           } else {
//             if (isAbout) {
//               showToasty('您当前已是最新版本');
//             }
//           }
//         }
//       } else {
//         ErrorResponseHandler().onErrorHandle(value.errorString());
//       }
//     }, onError: (error, stackTrace) {
//       ErrorResponseHandler().onErrorHandle(error, stackTrace: stackTrace);
//     });
//   }
//
//   /// 更新
//   static void _update(BuildContext context, VersionInfoEntity entity) {
//     DialogUtils().showVersionUpgradeAlert(context, entity, onConfirm: () {
//       _download(entity);
//     });
//   }
//
//   /// 开始下载
//   static void _download(VersionInfoEntity entity) async {
//     String destinationFilename = "htx_${SysUtils.timestamp}_apk";
//     try {
//       OtaUpdate().execute(entity.download.em(), destinationFilename: destinationFilename).listen((OtaEvent event) {
//         switch (event.status) {
//           case OtaStatus.DOWNLOADING: // 下载中
//             if (entity.force == true) {
//               var value = (double.tryParse('${event.value}') ?? 0) / 100;
//               showProgress(value);
//             }
//             break;
//           case OtaStatus.INSTALLING: //安装中
//             break;
//           case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
//             showToasty('更新失败，请稍后再试');
//             break;
//           default: // 其他问题
//             break;
//         }
//       }, onDone: () => dismissLoading());
//     } catch (e) {
//       showToasty('更新失败');
//     }
//   }







}
