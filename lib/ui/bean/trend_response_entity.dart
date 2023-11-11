
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart' as JS;
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';

@JS.JsonSerializable(genericArgumentFactories: true,createFactory: false,createToJson: false)
class TrendResponseEntity<T> {

  T? result;

	int? status;

	String? message;

	TrendResponseEntity({this.status,this.message});

	bool isOk(){
		return status == 10000;
	}

  factory TrendResponseEntity.fromJson(dynamic result,T Function(Object?) fromJsonT){
		// loggerArray(["请求返回结果",result]);
		var response = TrendResponseEntity<T>();
		if(result is Map){
			response.status = result['status'];
			response.message = result['message'];
			loggerArray(["泛型类型",T.toString()]);
			if(result['result'] != null){
				switch(T.toString()){
					case "String":
						if(result['result'] is Map){
							response.result = jsonEncode(result['result']) as T;
						}else {
							response.result = result['result']!.toString() as T;
						}
						break;
					default:
						response.result = fromJsonT.call(result['result']);
						break;
				}
			}
		}
		return response;
	}

	Map<String,dynamic> toJson(){
		final Map<String, dynamic> result = <String, dynamic>{};
		result['status'] = status;
		result['message'] = message;
		result['result'] = JsonConvert.fromJsonAsT(result);
		return result;
	}

	@override
  String toString() {
    return "";
  }



}