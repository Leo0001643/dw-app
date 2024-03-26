import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';

@JsonSerializable()
class BaseApiOssEntity {
	List<String>? baseAPIs;
	List<String>? webSockets;
	List<String>? dns;
	int? updateTime;

	//{"baseAPIs":["https://9000vlmdm4.kj99883.com/","https://9000vlmdm4.kj99883.com/"],"webSockets":["wss://9000ywfjn2.uy4ayov.com/","wss://9000ywfjn2.uy4ayov.com/"],"dns":["119.9.75.6"]}

	BaseApiOssEntity();

	factory BaseApiOssEntity.fromJson(Map<String, dynamic> json) => $BaseApiOssEntityFromJson(json);

	Map<String, dynamic> toJson() => $BaseApiOssEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<BaseWsApiEntity> toApiList(){
		var list = List<BaseWsApiEntity>.empty(growable: true);
		for(var i=0;i< baseAPIs.em();i++){
			var webSocket = webSockets.em() > i ? webSockets![i] : "";
			list.add(BaseWsApiEntity(baseAPIs![i],webSocket));
		}
		return list;
	}




}


class BaseWsApiEntity{
	String? baseApi;
	String? webSocket;
	int? delayTime;

	BaseWsApiEntity(this.baseApi, this.webSocket);
}





