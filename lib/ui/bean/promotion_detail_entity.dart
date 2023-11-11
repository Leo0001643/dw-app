import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/promotion_detail_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/promotion_detail_entity.g.dart';

@JsonSerializable()
class PromotionDetailEntity {
	@JSONField(name: "end_time")
	int? endTime;
	int? usepic;
	String? title;
	String? content;
	String? url;
	String? picurl;
	@JSONField(name: "start_time")
	int? startTime;
	@JSONField(name: "title_sec")
	String? titleSec;
	@JSONField(name: "update_time")
	String? updateTime;
	@JSONField(name: "lang_type")
	String? langType;
	@JSONField(name: "link_out")
	String? linkOut;
	String? sortby;
	String? status;

	PromotionDetailEntity();

	factory PromotionDetailEntity.fromJson(Map<String, dynamic> json) => $PromotionDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $PromotionDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}