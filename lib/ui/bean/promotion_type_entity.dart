import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

export 'package:leisure_games/generated/json/promotion_type_entity.g.dart';

class PromotionTypeEntity {
	Map<String,List<PromotionTypeKey>>? data;
	String? url;

	PromotionTypeEntity();

	factory PromotionTypeEntity.fromJson(Map<String, dynamic> json){
		var p = PromotionTypeEntity();
		p.url = json["url"];
		json.remove("url");
		p.data = <String,List<PromotionTypeKey>>{};
		var all = List<PromotionTypeKey>.empty(growable: true);
		json.forEach((key, value) {
			var list = List<PromotionTypeKey>.empty(growable: true);
			(value as List).forEach((element) {
				list.add(PromotionTypeKey.fromJson(element));
			});
			list.sort((a, b) => int.parse(a.sortby.em()) - int.parse(b.sortby.em()));
			p.data![key] = list;
			all.addAll(list);
		});
		all.sort((a, b) => int.parse(a.sortby.em()) - int.parse(b.sortby.em()));
		// loggerArray(["让我看看这里返回了什么呢",all]);
		p.data![Intr().quanbu] = all;
		return p;
	}


}

@JsonSerializable()
class PromotionTypeKey {
	String? picurl;
	@JSONField(name: "start_time")
	int? startTime;
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