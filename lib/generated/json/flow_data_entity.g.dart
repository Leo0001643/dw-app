import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/flow_data_entity.dart';

FlowDataEntity $FlowDataEntityFromJson(Map<String, dynamic> json) {
  final FlowDataEntity flowDataEntity = FlowDataEntity();
  final FlowDataPagation? pagation = jsonConvert.convert<FlowDataPagation>(
      json['pagation']);
  if (pagation != null) {
    flowDataEntity.pagation = pagation;
  }
  final List<FlowDataList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<FlowDataList>(e) as FlowDataList).toList();
  if (list != null) {
    flowDataEntity.list = list;
  }
  return flowDataEntity;
}

Map<String, dynamic> $FlowDataEntityToJson(FlowDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pagation'] = entity.pagation?.toJson();
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension FlowDataEntityExtension on FlowDataEntity {
  FlowDataEntity copyWith({
    FlowDataPagation? pagation,
    List<FlowDataList>? list,
  }) {
    return FlowDataEntity()
      ..pagation = pagation ?? this.pagation
      ..list = list ?? this.list;
  }
}

FlowDataList $FlowDataListFromJson(Map<String, dynamic> json) {
  final FlowDataList flowDataList = FlowDataList();
  final String? mtype = jsonConvert.convert<String>(json['mtype']);
  if (mtype != null) {
    flowDataList.mtype = mtype;
  }
  final String? transType = jsonConvert.convert<String>(json['transType']);
  if (transType != null) {
    flowDataList.transType = transType;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    flowDataList.remark = remark;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    flowDataList.time = time;
  }
  final String? mgold = jsonConvert.convert<String>(json['mgold']);
  if (mgold != null) {
    flowDataList.mgold = mgold;
  }
  final String? billno = jsonConvert.convert<String>(json['billno']);
  if (billno != null) {
    flowDataList.billno = billno;
  }
  final double? afterMoney = jsonConvert.convert<double>(json['afterMoney']);
  if (afterMoney != null) {
    flowDataList.afterMoney = afterMoney;
  }
  return flowDataList;
}

Map<String, dynamic> $FlowDataListToJson(FlowDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mtype'] = entity.mtype;
  data['transType'] = entity.transType;
  data['remark'] = entity.remark;
  data['time'] = entity.time;
  data['mgold'] = entity.mgold;
  data['billno'] = entity.billno;
  data['afterMoney'] = entity.afterMoney;
  return data;
}

extension FlowDataListExtension on FlowDataList {
  FlowDataList copyWith({
    String? mtype,
    String? transType,
    String? remark,
    String? time,
    String? mgold,
    String? billno,
    double? afterMoney,
  }) {
    return FlowDataList()
      ..mtype = mtype ?? this.mtype
      ..transType = transType ?? this.transType
      ..remark = remark ?? this.remark
      ..time = time ?? this.time
      ..mgold = mgold ?? this.mgold
      ..billno = billno ?? this.billno
      ..afterMoney = afterMoney ?? this.afterMoney;
  }
}

FlowDataPagation $FlowDataPagationFromJson(Map<String, dynamic> json) {
  final FlowDataPagation flowDataPagation = FlowDataPagation();
  final int? totalNumber = jsonConvert.convert<int>(json['totalNumber']);
  if (totalNumber != null) {
    flowDataPagation.totalNumber = totalNumber;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    flowDataPagation.pageSize = pageSize;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    flowDataPagation.page = page;
  }
  final int? allPage = jsonConvert.convert<int>(json['allPage']);
  if (allPage != null) {
    flowDataPagation.allPage = allPage;
  }
  return flowDataPagation;
}

Map<String, dynamic> $FlowDataPagationToJson(FlowDataPagation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalNumber'] = entity.totalNumber;
  data['pageSize'] = entity.pageSize;
  data['page'] = entity.page;
  data['allPage'] = entity.allPage;
  return data;
}

extension FlowDataPagationExtension on FlowDataPagation {
  FlowDataPagation copyWith({
    int? totalNumber,
    int? pageSize,
    int? page,
    int? allPage,
  }) {
    return FlowDataPagation()
      ..totalNumber = totalNumber ?? this.totalNumber
      ..pageSize = pageSize ?? this.pageSize
      ..page = page ?? this.page
      ..allPage = allPage ?? this.allPage;
  }
}