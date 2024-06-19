
import 'package:common_utils/common_utils.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';
///普通事件
EventBus eventBus=EventBus();
///可用于黏性事件
EventBus behaviorBus = EventBus.customController(BehaviorSubject());

///显示Toast消息
Future<void> showToast(String message,{bool? toastLength,}){
  return EasyLoading.showToast(message,duration: toastLength == true ? const Duration(seconds: 3):const Duration(seconds: 1));
}

///显示Toast消息
void showToastFull(String message,{bool? toastLength,}){
  EasyLoading.showToast(message,duration: toastLength == true ? const Duration(seconds: 3):const Duration(seconds: 1));
}

///是否debug环境
final isDebug = !inProduct();

///判断程序当前的运行环境
bool inProduct(){
  // return false;
  return const bool.fromEnvironment("dart.vm.product");
}


/// 数据判空 接受任意类型数据
bool isEmpty(Object? obj) => ObjectUtil.isEmpty(obj);

/// 数据判空 接受任意类型数据
bool unEmpty(Object? obj) => ObjectUtil.isNotEmpty(obj);

///是否int型
bool isInt(Object? obj) => unEmpty(obj) && int.tryParse(obj.toString()) != null;

///钱包符号
String symbolB(int? type){
  switch(type){
    case 1:
      return '¥';
    case 5:
      return '₮';
    default:
      return '';
  }
}

extension StringExtension on String? {
  ///防止字段为空报错
  String em({String aft = ""}){
    return isEmpty(this) ? aft : this!;
  }

  ///判断是否服务器链接
  bool isUrl(){
    return unEmpty(this) && ( this!.startsWith("http"));// || GetUtils.isURL(this!)
  }

  int parseInt(){
    return int.parse(em(aft: "0"));
  }

  double parseDouble(){
    return double.parse(em(aft: "0.00"));
  }
}

extension NumExtension on num? {
  ///防止字段为空报错
  num em(){
    return this == null ? 0 : this!;
  }

  ///数字转金额保留两位小数
  String toAmount(){
    return em().toStringAsFixed(2);
  }

}

extension IntExtension on int? {
  ///防止字段为空报错
  int em(){
    return this == null ? 0 : this!;
  }
}

extension DoubleExtension on double? {
  ///防止字段为空报错
  double em(){
    return this == null ? 0.0 : this!;
  }
}

extension ListExtension on List? {
  ///防止字段为空报错
  int em(){
    return this == null ? 0 : this!.length;
  }
}

extension MapExtension on Map? {
  ///防止字段为空报错
  int em(){
    return this == null ? 0 : this!.length;
  }

}

