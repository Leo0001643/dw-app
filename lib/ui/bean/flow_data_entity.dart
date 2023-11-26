import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/flow_data_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/flow_data_entity.g.dart';

@JsonSerializable()
class FlowDataEntity {
	List<FlowDataList>? list;
	FlowDataPagation? pagation;

	FlowDataEntity();

	factory FlowDataEntity.fromJson(Map<String, dynamic> json) => $FlowDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $FlowDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FlowDataList {
	String? mtype;
	String? transType;
	String? remark;
	String? time;
	double? afterMoney;
	String? mgold;
	String? billno;

	FlowDataList();

	factory FlowDataList.fromJson(Map<String, dynamic> json) => $FlowDataListFromJson(json);

	Map<String, dynamic> toJson() => $FlowDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FlowDataPagation {
	int? totalNumber;
	int? pageSize;
	int? page;
	int? allPage;

	FlowDataPagation();

	factory FlowDataPagation.fromJson(Map<String, dynamic> json) => $FlowDataPagationFromJson(json);

	Map<String, dynamic> toJson() => $FlowDataPagationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}