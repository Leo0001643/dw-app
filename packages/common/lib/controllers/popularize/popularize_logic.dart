import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aone_common/controllers/popularize/popularize_state.dart';
import 'package:aone_common/data/model/entities/webui/quanmintg_echoImg.dart';
import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../common.dart';

class PopularizeLogic extends BaseController {
  static PopularizeLogic get to => Get.find();

  PopularizeState state = PopularizeState();

  PromotingProvider provider = PromotingProvider();

  // 佣金说明
  Future<void> yjIntroduce() async {
    await fetchHandler<QuanmintgYiIntroduce>(
      provider.getCommissionInfo(),
      onSuccess: (value) => state.quanmintgYiIntroduce = value,
    );
  }

  // 推广列表
  Future<void> userYjInfo() async {
    await fetchHandler<QuanmintgUserYjInfo>(provider.getPromoList(),
        onSuccess: (item) {
      state.quanmintgUserYjInfo = item;
      SpStorage.setValue(
          "quanmintgUserYjInfo", state.quanmintgUserYjInfo.items?.tjUrl ?? '');
      return state.quanmintgUserYjInfo;
    });
  }

  // 历史业绩
  Future<void> yjOrderList() async {
    YiOrderListDto dto = YiOrderListDto(
      currentPage: 1,
      currentPageTotal: 100,
    );
    await fetchHandler<QuanmintgYiOrderList>(
      provider.getSalesHistory(dto),
      onSuccess: (item) => state.quanmintgYiOrderList = item,
    );
  }

  // 领取佣金
  Future<void> getYongJin(YongJinDto dto) async {
    await fetchHandler<YongJinEntity>(provider.getCommission(dto),
        onSuccess: (item) {
      SmartDialog.showToast(item.message!);
    });
  }

  // 输出海报图片
  Future<void> echoImg() async {
    await fetchHandler<QuanmintgEchoImgEntity>(provider.echoImg(),
        onSuccess: (item) {
      state.echoImg = item.img ?? '';
      // SmartDialog.showToast(item.message!);
    });
  }

  @override
  void onInit() async {
    startLoading();
    state.tjUrl = SpStorage.getValue("quanmintgUserYjInfo");
    printInfo(info: "------>state.tjUrl   ${state.tjUrl} ");
    await echoImg();
    await yjIntroduce();
    await userYjInfo();
    await yjOrderList();
    super.onInit();
    stopLoading();
  }

  saveImg(String url) async {
    requestPermission();
    if (state.hasPermission) {
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      SmartDialog.showToast('save.img'.tr);
    } else {
      SmartDialog.showToast('permission.open'.tr);
    }
  }

  shareImg(String url) async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    Share.shareXFiles([XFile.fromData(response.data, mimeType: 'image/jpeg')]);
  }

  shareUrl(String url) async {
    print('图片链接 == ${url}');
    // Share.share(url, subject: "我的分享");
    // final files = []<>;

    Share.share('代理分享 ${url}', subject: '我的分享');
    // Share.shareXFiles(files,text: '代理分享 ${url}', subject: '我的分享');
    // Share.shareFiles('',text: '',);
  }

  Future<bool> requestPermission() async {
    bool hasBluetoothPermission = await requestStoragePermission();
    if (hasBluetoothPermission) {
      print("内存使用权限申请通过");
      state.hasPermission = true;
    } else {
      print("内存使用权限申请不通过");
      state.hasPermission = false;
    }
    return hasBluetoothPermission;
  }

  Future<bool> requestStoragePermission() async {
    //获取当前的权限
    var status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
