// import 'dart:typed_data';
//
// import 'package:aone_common/controllers/recharge/recharge_state.dart';
// import 'package:aone_common/data/model/entities/webui/deposit_hy.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
//
// import '../../common.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class RechargeLogic extends BaseController with GetTickerProviderStateMixin {
//   static RechargeLogic get to => Get.find();
//
//   RechargeProvider provider = RechargeProvider();
//   RechargeState state = RechargeState();
//
//   // form fields
//   RechargeFormFields formFields = RechargeFormFields();
//
//   @override
//   void onInit() {
//     super.onInit();
//     getPayxsproduct();
//     deposityh();
//   }
//
//   initTabBar(int count) async {
//     state.tabController =
//         TabController(vsync: this, length: count, initialIndex: 0);
//   }
//
//   // 充值列表
//   Future<void> getPayxsproduct() async {
//     await fetchHandler<PayCategoryEntity>(
//       provider.getPayxsproduct(),
//       onSuccess: (res) {
//         state.payCategoryEntity = res;
//         state.onlineInfo = res.onlineInfo;
//         state.currentProduct = res.xsItems?.first;
//         state.xsItems
//           ..clear()
//           ..addAll(res.xsItems!);
//         state.xxItems
//           ..clear()
//           ..addAll(res.xxItems!);
//         state.vipItems
//           ..clear()
//           ..addAll(res.vipItems!);
//       }
//     );
//   }
//
//   // 充值 优惠比例
//   Future<void> deposityh() async {
//     await fetchHandler<DepositYhEntity>(
//       provider.deposityh(),
//     ).then((value) => state.rate = value);
//   }
//
// // 充值
//   Future<void> payxxpay() async {
//     PayxxpayDto payxxpayDto = PayxxpayDto();
//     var form = state.formKey.currentState!.value;
//     payxxpayDto.itemId = state.itemId;
//     payxxpayDto.cunkuanren = form[RechargeFormFields.cunkuanren];
//     payxxpayDto.money = form[RechargeFormFields.money];
//     payxxpayDto.order = form[RechargeFormFields.order];
//     payxxpayDto.ishd = 1;
//     payxxpayDto.tag = (state.currentProduct as TransferCategory).tag;
//
//     await fetchHandler<YongJinEntity>(provider.payxxpay(payxxpayDto),
//         onSuccess: (item) {
//       SmartDialog.showToast(item.message!);
//     });
//
//     state.formKey.currentState!.fields['cunkuanren']!.didChange("");
//     state.formKey.currentState!.fields['money']!.didChange("");
//     state.formKey.currentState!.fields['order']!.didChange("");
//   }
//
//   saveImg(String url) async {
//     requestPermission();
//     if (state.hasPermission) {
//       var response = await Dio()
//           .get(url, options: Options(responseType: ResponseType.bytes));
//       final result =
//           await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
//       SmartDialog.showToast('save.img'.tr);
//     } else {
//       SmartDialog.showToast('permission.open'.tr);
//     }
//   }
//
//   @override
//   void dispose() {
//     state.banknameController.dispose();
//     super.dispose();
//   }
//
//   void initTextEditingController() {
//     if (state.transferProduct != null) {
//       state.banknameController.text = state.transferProduct!.bankname!;
//       state.cardController.text = state.transferProduct!.card!;
//       state.userTruenameController.text = state.transferProduct!.userTruename!;
//       state.zhihangController.text = state.transferProduct!.zhihang!;
//     }
//   }
//
//   void onSelectClose(OnlineProductChannel value) {
//     state.formKey.currentState!.fields['channel']!.didChange(value.name);
//     state.selectedValue.value = value.name!;
//     state.onlineProductChannel = value;
//   }
//
//   void getRate() {
//     var transferCategory = state.currentProduct as TransferCategory;
//     int? id = transferCategory.id;
//     for (int i = 0; i < state.rate.paymentWays!.length; i++) {
//       PaymentWays paymentWays = state.rate.paymentWays![i];
//       if (paymentWays.id == id) {
//         state.coefficient = paymentWays.yhRatioNew;
//         break;
//       }
//     }
//   }
//
//   Future<bool> requestPermission() async {
//     bool hasBluetoothPermission = await requestStoragePermission();
//     if (hasBluetoothPermission) {
//       debugPrint("内存使用权限申请通过");
//       state.hasPermission = true;
//     } else {
//       debugPrint("内存使用权限申请不通过");
//       state.hasPermission = false;
//     }
//     return hasBluetoothPermission;
//   }
//
//   Future<bool> requestStoragePermission() async {
//     //获取当前的权限
//     var status = await Permission.storage.status;
//     if (status == PermissionStatus.granted) {
//       //已经授权
//       return true;
//     } else {
//       //未授权则发起一次申请
//       status = await Permission.storage.request();
//       if (status == PermissionStatus.granted) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//   }
// }

import 'dart:typed_data';

import 'package:aone_common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

part 'recharge_state.dart';
part 'recharge_interface.dart';

class RechargeLogic extends BaseController {
  RechargeProvider provider = RechargeProvider();
  RechargeState state = RechargeState();

  // form fields
  RechargeFormFields formFields = RechargeFormFields();

  List<BasePayCategory> payCategoryList = RxList.empty();

  @override
  Future<void> onInit() async {
    startLoading();
    super.onInit();
    await getPayxsproduct();
    await deposityh();
    stopLoading();
  }

  // 获取充值渠道列表
  Future<void> getPayxsproduct() async {
    await fetchHandler<PayCategoryEntity>(provider.getPayxsproduct(),
        onSuccess: (res) {
      if (res.onlineInfo != null) {
        // 请求用户的信息
        state.onlineInfo = res.onlineInfo;
      }
      // response
      state.payCategoryEntity = res;
      // 整合全部通道到列表中供部分需要的目标展示用
      payCategoryList.addAll([
        ...res.xsItems ?? [],
        ...res.xxItems ?? [],
        ...res.vipItems ?? [],
      ]);

      state.xsItems
        ..clear()
        ..addAll(res.xsItems ?? []);
      state.xxItems
        ..clear()
        ..addAll(res.xxItems ?? []);
      state.vipItems
        ..clear()
        ..addAll(res.vipItems ?? []);
    }, onComplete: () {
      if (payCategoryList.isEmpty) {
        pageEmpty();
      } else {
        stopLoading();
      }
      update();
    });
  }

  // 获取充值优惠
  Future<void> deposityh() async {
    await fetchHandler<DepositYhEntity>(
      provider.deposityh(2),
      onSuccess: (value) {
        if (value == null) {
          state.rate = DepositYhEntity();
        } else {
          state.rate = value;
        }

        print('valuevaluevalue:$value');
      },
    );
    await fetchHandler<DepositYhEntity>(provider.deposityh(3),
        onSuccess: (value) {
      state.onlineRate = value.yhRatio!;

      print('value.yhRatio:${value.yhRatio}');
    });
  }

  // 保存图片
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

  // 获取当前转账汇款通道的优惠比例
  void getRate() {
    var transferCategory = state.currentProduct as TransferCategory;
    int? id = transferCategory.id;
    for (int i = 0; i < state.rate.paymentWays!.length; i++) {
      PaymentWays paymentWays = state.rate.paymentWays![i];
      if (paymentWays.id == id) {
        state.coefficient = paymentWays.yhRatioNew;
        break;
      }
    }
  }

  // 检查内存使用权限
  Future<bool> requestPermission() async {
    bool hasBluetoothPermission = await requestStoragePermission();
    if (hasBluetoothPermission) {
      debugPrint("内存使用权限申请通过");
      state.hasPermission = true;
    } else {
      debugPrint("内存使用权限申请不通过");
      state.hasPermission = false;
    }
    return hasBluetoothPermission;
  }

  // 请求内存使用权限
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
