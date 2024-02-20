import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/platform_entity.g.dart';

export 'package:leisure_games/generated/json/platform_entity.g.dart';

@JsonSerializable()
class PlatformEntity {
	int? liveId;
	String? liveName;
	String? currency;
	double? money;
	int? sequence;

	PlatformEntity({this.liveId,this.liveName,this.currency,this.money});

	factory PlatformEntity.fromJson(Map<String, dynamic> json) => $PlatformEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlatformEntityToJson(this);

	@override
	String toString() {
		if(liveName == "main"){
			return Intr().zhuzhanghao;
		}else {
			return liveName.em();
		}
	}
}