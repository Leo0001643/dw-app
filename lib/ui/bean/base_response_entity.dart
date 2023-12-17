
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart' as JS;
import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/language_msg_entity.dart';

@JS.JsonSerializable(genericArgumentFactories: true,createFactory: false,createToJson: false)
class BaseResponseEntity<T> {

  T? data;

	int? code;

	LanguageMsgEntity? message;

	BaseResponseEntity({this.code,this.message});

	bool isOk(){
		return code == 100000;
	}

  factory BaseResponseEntity.fromJson(dynamic result,T Function(Object?) fromJsonT){
		// loggerArray(["请求返回结果",result]);
		var response = BaseResponseEntity<T>();
		if(result is Map){
			response.code = result['code'];
			response.message = LanguageMsgEntity.fromJson(result['message']);
			if(result['data'] != null){
				switch(T.toString()){
					case "String":
						// loggerArray(["泛型类型",T.toString(),result['result']]);
						if(result['data'] is Map){
							response.data = jsonEncode(result['data']) as T;
						}else {
							response.data = result['data']!.toString() as T;
						}
						break;
					default:
						response.data = fromJsonT.call(result['data']);
						break;
				}
				// response.data = fromJsonT.call(result['data']);//JsonConvert.fromJsonAsT(result['data']);
			}
		}
		return response;
	}

	Map<String,dynamic> toJson(){
		final Map<String, dynamic> result = <String, dynamic>{};
		result['code'] = code;
		result['message'] = message?.toJson();
		result['data'] = JsonConvert.fromJsonAsT(data);
		return result;
	}

	@override
  String toString() {
    return "";
  }



}