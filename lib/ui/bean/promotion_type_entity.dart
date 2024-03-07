import 'dart:convert';

import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

export 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

class PromotionTypeEntity {
	List<PromotionTypeKey>? chongzhi;
	List<PromotionTypeKey>? qita;
	String? url;

	PromotionTypeEntity({this.chongzhi,this.qita,this.url});

	factory PromotionTypeEntity.fromJson(Map<String, dynamic> json){
		var p = PromotionTypeEntity();
		p.url = json["url"];

		var czJson = AppData.localeIndex() == 0 ? json["充值"] : json["充值"];

		if(unEmpty(czJson)){
			var cz = List<PromotionTypeKey>.empty(growable: true);
			(czJson as List).forEach((element) {
				cz.add(PromotionTypeKey.fromJson(element));
			});
			p.chongzhi = cz;
		}
		var qtJson = AppData.localeIndex() == 0 ? json["其他"] : json["Others"];

		if(unEmpty(qtJson)){
			var qt = List<PromotionTypeKey>.empty(growable: true);
			(qtJson as List).forEach((element) {
				qt.add(PromotionTypeKey.fromJson(element));
			});
			p.qita = qt;
		}

		p.url = json["url"];
		return p;
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