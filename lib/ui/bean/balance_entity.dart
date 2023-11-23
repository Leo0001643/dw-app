import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/balance_entity.g.dart';
export 'package:leisure_games/generated/json/balance_entity.g.dart';

@JsonSerializable()
class BalanceEntity {
	double? money;
	String? language;
	String? icon;

	BalanceEntity({this.language,this.icon,this.money});

	factory BalanceEntity.fromJson(Map<String, dynamic> json) => $BalanceEntityFromJson(json);

	Map<String, dynamic> toJson() => $BalanceEntityToJson(this);

	@override
	String toString() {
		return language.em();
	}
}