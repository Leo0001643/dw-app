import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/aws_utils.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/ota_version_entity.dart';
import 'package:ota_update/ota_update.dart';
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
    String destinationFilename = "${AwsUtils().getBucket()}_${DateUtil.formatDate(DateTime.now(),format: "yyyyMMddHHmmss")}_apk";
    try {
      loggerArray(["apk下载地址打印",entity.url]);
      OtaUpdate().execute(entity.url.em(), destinationFilename: destinationFilename)
          .listen((OtaEvent event) {
        loggerArray(["收到更新下载回调了",event.status,event.value]);
        switch (event.status) {
          case OtaStatus.DOWNLOADING: // 下载中
            // if (entity.isMust()) {
              var value = (double.tryParse('${event.value}') ?? 0) / 100;
              EasyLoading.showProgress(value,maskType: EasyLoadingMaskType.black);
            // }
            break;
          case OtaStatus.INSTALLING: //安装中
            break;
          case OtaStatus.CANCELED: //已取消
            break;
          default: // 其他问题
            ErrorResponseHandler().onErrorHandle(event.value);
            break;
        }
      }, onDone: () => EasyLoading.dismiss());
    } catch (e) {
      ErrorResponseHandler().onErrorHandle(e);
    }
  }







}
