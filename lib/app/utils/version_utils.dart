import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/ota_version_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dialog_utils.dart';

/// 版本管理工具类
class VersionUtils {

  VersionUtils._internal();

  static VersionUtils? instance;

  static getInstance() {
    instance ??= VersionUtils._internal();
    return instance;
  }

  factory VersionUtils() => getInstance();

  /// 版本检测
  Future<bool> checkNewVersion() async {
    var value = await HttpService.otaUpdate();
    loggerArray(["版本对比",value.android?.version,value.iOS?.version,AppData.deviceInfo().version]);
    if(GetPlatform.isAndroid && formatVersion(value.android?.version) > formatVersion(AppData.deviceInfo().version)){
      return true;
    }else if(GetPlatform.isIOS && formatVersion(value.iOS?.version) > formatVersion(AppData.deviceInfo().version)){
      return true;
    }
    return false;
  }


  /// 版本检测
  void checkVersion(BuildContext context) {
    ///先申请安装权限
    Permission.requestInstallPackages.request().then((value) {
      if(value.isGranted){
        HttpService.otaUpdate().then((value) {
          loggerArray(["版本对比",value.android?.version,value.iOS?.version,AppData.deviceInfo().version]);
          if(GetPlatform.isAndroid && formatVersion(value.android?.version) > formatVersion(AppData.deviceInfo().version)){
            _update(context, value.android!);
          }else if(GetPlatform.isIOS && formatVersion(value.iOS?.version) > formatVersion(AppData.deviceInfo().version)){
            _update(context, value.iOS!);
          }else {
            showToast(Intr().yijingshizuixinl);
          }
        });
      } else {
        showToast(Intr().weishouxuanzhuangquanxian);
      }
    });
  }

  /// 更新
  void _update(BuildContext context, OtaVersionIOS entity) {
    DialogUtils().showOtaUpdateDialog(context, entity).then((value){
      if(value == true){
        if(GetPlatform.isAndroid){
          _download(entity);
        } else if(GetPlatform.isIOS){
          launchUrlString(entity.url.em());
        }
      }
    });
  }

  int formatVersion(String? version) {
    if(unEmpty(version)){
      return int.tryParse(version!.replaceAll(".", "").trim()) ?? 0;
    }
    return 0;
  }

  /// 开始下载
  static void _download(OtaVersionIOS entity) async {
    var destinationFilename = "${ConfigManager.getBucket()}_${DateUtil.formatDate(DateTime.now(),format: "yyyyMMddHHmmss")}.apk";
    try {
      var dir = await getDownloadsDirectory();
      var fillName = "${dir?.path}/$destinationFilename";
      loggerArray(["apk下载地址打印",entity.url,fillName]);

      Dio().download(entity.url.em(), fillName,onReceiveProgress: (count,total){
        if (total <= 0) return;
        var value = (count / total);
        EasyLoading.showProgress(value,maskType: EasyLoadingMaskType.black);
      }).then((value) {
        EasyLoading.dismiss();
        var response = value.data as ResponseBody;
        if(response.statusCode >= 200 && response.statusCode <= 299){
          loggerArray(["文件是否存在",fillName,File(fillName).existsSync()]);
          if(File(fillName).existsSync()){
              InstallPlugin.install(fillName).then((value) {
                loggerArray(["跳转更新了吗",value]);
              });
          }
        } else {
          ErrorResponseHandler().onErrorHandle({"code": response.statusCode,"message": response.statusMessage.toString()});
        }
      },onError: (e)=> ErrorResponseHandler().onErrorHandle(e));
    } catch (e) {
      ErrorResponseHandler().onErrorHandle(e);
    }
  }







}
