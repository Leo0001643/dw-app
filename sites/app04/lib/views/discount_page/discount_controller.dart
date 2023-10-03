import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class DiscountController extends BaseController {
  TextEditingController numberTF = TextEditingController();
  TextEditingController strTF = TextEditingController();
  TextEditingController timeTF = TextEditingController();
  TextEditingController priceTF = TextEditingController();
  List<TextEditingController> inputList = [];
  var time = ''.obs;
  var activityid = 0;
  GlobalKey<FormBuilderState> regFormKey = GlobalKey<FormBuilderState>();
  ActivityProvider provider = ActivityProvider();
  ActivityApplyEntity? activityApplyEntity;
  bool timeIsRequired = false;
  bool selectIsRequired = false;
  @override
  void onInit() {
    // TODO: implement onInit
    inputList = [numberTF, strTF, timeTF,priceTF];
  }

  //单选
  var selectTag = ''.obs;
  // RxString selectTag = '1' as RxString;
//  RxList<Bets> betList = new RxList([]);

  void setTime(String timeS) {
    time.value = timeS;
    timeTF.text = timeS;
  }

  Future<void> postData() async {
    // var result = regFormKey.currentState!.validate();
    // if(result) {
       List args = List.empty(growable: true);
       args.add(ExtArgs(extName: '1', extVal: numberTF.text));
       args.add(ExtArgs(extName: '2', extVal: strTF.text));
       args.add(ExtArgs(extName: '3', extVal: time.value));
       args.add(ExtArgs(extName: '4', extVal: priceTF.text));
       args.add(ExtArgs(extName: '5', extVal: selectTag.value));
       var dto = UserJoinVDto(activityid: activityid, extArgs: jsonEncode(args));
       await fetchHandler<CommonTipsEntity>(provider.userJoin(dto),
          onSuccess: (res) {
            SmartDialog.showToast(res.message ?? '申请成功');
            Get.back();
          });
    // }

    // var res = await ActivityApi.userJoinV2(dto, noLoading: false);
    // if (res.status == Status.done) {
    //   SmartDialog.showToast('申请成功');
    //   Get.back();
    // } else {
    //   SmartDialog.showToast(res.message ?? '申请失败');
    // }
  }

  void selectBox() {
    if (selectTag.value == '1') {
      selectTag.value = '0';
    } else {
      selectTag.value = '1';
    }
  }
}
