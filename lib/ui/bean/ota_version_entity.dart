import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ota_version_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/ota_version_entity.g.dart';

@JsonSerializable()
class OtaVersionEntity {
	OtaVersionIOS? iOS;
	@JSONField(name: "Android")
	OtaVersionIOS? android;

	OtaVersionEntity();

	factory OtaVersionEntity.fromJson(Map<String, dynamic> json) => $OtaVersionEntityFromJson(json);

	Map<String, dynamic> toJson() => $OtaVersionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OtaVersionIOS {
	String? note;
	String? minVersion;
	String? must;
	String? version;
	String? url;

	OtaVersionIOS();

	factory OtaVersionIOS.fromJson(Map<String, dynamic> json) => $OtaVersionIOSFromJson(json);

	Map<String, dynamic> toJson() => $OtaVersionIOSToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	bool isMust(){
		return must == 'true';
	}


}
