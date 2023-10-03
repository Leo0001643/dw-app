import 'package:get/get.dart';

class WheelPlay {
  int? id;
  String? name;
  String? amount;
  int? itemType;
  bool? ritemType;
  int? xmlType;

  // if status code = 406
  int? statusCode;
  int? code;
  String? stra;
  String? strb;
  String? message; // 自定义message

  WheelPlay({
    this.id,
    this.name,
    this.amount,
    this.itemType,
    this.ritemType,
    this.xmlType,
  });

  WheelPlay.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    amount = "${json['amount']}";
    itemType = json['item_type'];
    ritemType = json['ritem_type'];
    xmlType = json['xml_type'];

    statusCode = json['status_code'];
    code = json['code'];
    stra = json['stra'];
    strb = json['strb'];
    if (statusCode == 406) {
      message = _message();
    }
  }


  _message() {
    var isDay = stra!.contains('天'.tr) || stra!.contains('day');
    // var msg = "You finished the mission,but fortune wheel isn't open yet. ${isDay ? 'Daily' : 'Every'} ${isDay ? strb : _setDay(stra!) + ' ' + strb} o'clock";
    var msg2 = "不在抽奖活动时间,请于".tr + " $stra $strb "+ '进行抽奖'.tr;
    return msg2;
  }

  _setDay(String strA) {

  }
}
