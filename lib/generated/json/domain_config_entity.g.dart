import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/domain_config_entity.dart';

DomainConfigEntity $DomainConfigEntityFromJson(Map<String, dynamic> json) {
  final DomainConfigEntity domainConfigEntity = DomainConfigEntity();
  final List<String>? agDomain = (json['agDomain'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (agDomain != null) {
    domainConfigEntity.agDomain = agDomain;
  }
  final List<String>? frontDomain = (json['frontDomain'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (frontDomain != null) {
    domainConfigEntity.frontDomain = frontDomain;
  }
  return domainConfigEntity;
}

Map<String, dynamic> $DomainConfigEntityToJson(DomainConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['agDomain'] = entity.agDomain;
  data['frontDomain'] = entity.frontDomain;
  return data;
}

extension DomainConfigEntityExtension on DomainConfigEntity {
  DomainConfigEntity copyWith({
    List<String>? agDomain,
    List<String>? frontDomain,
  }) {
    return DomainConfigEntity()
      ..agDomain = agDomain ?? this.agDomain
      ..frontDomain = frontDomain ?? this.frontDomain;
  }
}