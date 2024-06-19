import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';

export 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';

@JsonSerializable()
class BaseApiOssEntity {
	List<String>? baseAPIs;
	List<String>? webSockets;
	List<String>? dns;
	int? updateTime;
	String? download;

	//{"baseAPIs":["https://9000vlmdm4.kj99883.com/","https://9000vlmdm4.kj99883.com/"],"webSockets":["wss://9000ywfjn2.uy4ayov.com/","wss://9000ywfjn2.uy4ayov.com/"],"dns":["119.9.75.6"]}

	//{
	//     "baseAPIs": [
	//         "https://9005mmq5y2.mzm3mzdj.com/"
	//     ],
	//     "webSockets": [
	//         "wss://9005zmzjzm.njc2n2m5.com:443/"
	//     ],
	//     "download": "https://gjz-app-down1.s3.ap-east-1.amazonaws.com/fuyuan/fuyuan.apk"
	// }

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
			list.add(BaseWsApiEntity(baseApi: baseAPIs![i],webSocket: webSocket,index: i));
		}
		return list;
	}




}

@JsonSerializable()
class BaseWsApiEntity{
	String? baseApi;
	String? webSocket;
	int? delayTime;
	int? index;

	BaseWsApiEntity({this.baseApi, this.webSocket,this.index});

	factory BaseWsApiEntity.fromJson(Map<String, dynamic> json) => $BaseWsApiEntityFromJson(json);

	Map<String, dynamic> toJson() => $BaseWsApiEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

}





