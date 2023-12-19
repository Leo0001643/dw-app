import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/language_msg_entity.g.dart';

export 'package:leisure_games/generated/json/language_msg_entity.g.dart';

@JsonSerializable()
class LanguageMsgEntity {
	String? zh;
	String? en;
	String? vi;

	LanguageMsgEntity();

	factory LanguageMsgEntity.fromJson(Map<String, dynamic> json) => $LanguageMsgEntityFromJson(json);

	Map<String, dynamic> toJson() => $LanguageMsgEntityToJson(this);

	@override
	String toString() {
		switch(Intr().currentLocale().languageCode){
			case "en":
				return en.em();
			case "vi":
				return vi.em();
			default:
				return zh.em();
		}
	}



}