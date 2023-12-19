import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

export 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

@JsonSerializable()
class PromotionTypeEntity {
	@JSONField(name: "充值")
	List<PromotionTypeKey>? chongzhi;
	@JSONField(name: "其他")
	List<PromotionTypeKey>? qita;
	String? url;

	PromotionTypeEntity();

	factory PromotionTypeEntity.fromJson(Map<String, dynamic> json) => $PromotionTypeEntityFromJson(json);

	Map<String, dynamic> toJson() => $PromotionTypeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PromotionTypeKey {
	String? picurl;
	@JSONField(name: "start_time")
	String? startTime;
	@JSONField(name: "title_sec")
	String? titleSec;
	@JSONField(name: "end_time")
	int? endTime;
	@JSONField(name: "lang_type")
	String? langType;
	String? sortby;
	String? id;
	String? type;
	String? title;

	PromotionTypeKey();

	factory PromotionTypeKey.fromJson(Map<String, dynamic> json) => $PromotionTypeKeyFromJson(json);

	Map<String, dynamic> toJson() => $PromotionTypeKeyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}