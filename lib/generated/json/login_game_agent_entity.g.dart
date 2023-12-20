import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/login_game_agent_entity.dart';

LoginGameAgentEntity $LoginGameAgentEntityFromJson(Map<String, dynamic> json) {
  final LoginGameAgentEntity loginGameAgentEntity = LoginGameAgentEntity();
  final String? platformURL = jsonConvert.convert<String>(json['platformURL']);
  if (platformURL != null) {
    loginGameAgentEntity.platformURL = platformURL;
  }
  final int? lid = jsonConvert.convert<int>(json['lid']);
  if (lid != null) {
    loginGameAgentEntity.lid = lid;
  }
  final String? clientType = jsonConvert.convert<String>(json['clientType']);
  if (clientType != null) {
    loginGameAgentEntity.clientType = clientType;
  }
  final LoginGameAgentParams? params = jsonConvert.convert<
      LoginGameAgentParams>(json['params']);
  if (params != null) {
    loginGameAgentEntity.params = params;
  }
  final List<String>? url = (json['url'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (url != null) {
    loginGameAgentEntity.url = url;
  }
  return loginGameAgentEntity;
}

Map<String, dynamic> $LoginGameAgentEntityToJson(LoginGameAgentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['platformURL'] = entity.platformURL;
  data['lid'] = entity.lid;
  data['clientType'] = entity.clientType;
  data['params'] = entity.params?.toJson();
  data['url'] = entity.url;
  return data;
}

extension LoginGameAgentEntityExtension on LoginGameAgentEntity {
  LoginGameAgentEntity copyWith({
    String? platformURL,
    int? lid,
    String? clientType,
    LoginGameAgentParams? params,
    List<String>? url,
  }) {
    return LoginGameAgentEntity()
      ..platformURL = platformURL ?? this.platformURL
      ..lid = lid ?? this.lid
      ..clientType = clientType ?? this.clientType
      ..params = params ?? this.params
      ..url = url ?? this.url;
  }
}

LoginGameAgentParams $LoginGameAgentParamsFromJson(Map<String, dynamic> json) {
  final LoginGameAgentParams loginGameAgentParams = LoginGameAgentParams();
  final String? r = jsonConvert.convert<String>(json['r']);
  if (r != null) {
    loginGameAgentParams.r = r;
  }
  final String? param = jsonConvert.convert<String>(json['param']);
  if (param != null) {
    loginGameAgentParams.param = param;
  }
  final String? encrypt = jsonConvert.convert<String>(json['encrypt']);
  if (encrypt != null) {
    loginGameAgentParams.encrypt = encrypt;
  }
  return loginGameAgentParams;
}

Map<String, dynamic> $LoginGameAgentParamsToJson(LoginGameAgentParams entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['r'] = entity.r;
  data['param'] = entity.param;
  data['encrypt'] = entity.encrypt;
  return data;
}

extension LoginGameAgentParamsExtension on LoginGameAgentParams {
  LoginGameAgentParams copyWith({
    String? r,
    String? param,
    String? encrypt,
  }) {
    return LoginGameAgentParams()
      ..r = r ?? this.r
      ..param = param ?? this.param
      ..encrypt = encrypt ?? this.encrypt;
  }
}