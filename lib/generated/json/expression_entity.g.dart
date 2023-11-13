import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/expression_entity.dart';

ExpressionEntity $ExpressionEntityFromJson(Map<String, dynamic> json) {
  final ExpressionEntity expressionEntity = ExpressionEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    expressionEntity.type = type;
  }
  final String? typeImgUrl = jsonConvert.convert<String>(json['typeImgUrl']);
  if (typeImgUrl != null) {
    expressionEntity.typeImgUrl = typeImgUrl;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    expressionEntity.images = images;
  }
  return expressionEntity;
}

Map<String, dynamic> $ExpressionEntityToJson(ExpressionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['typeImgUrl'] = entity.typeImgUrl;
  data['images'] = entity.images;
  return data;
}

extension ExpressionEntityExtension on ExpressionEntity {
  ExpressionEntity copyWith({
    String? type,
    String? typeImgUrl,
    List<String>? images,
  }) {
    return ExpressionEntity()
      ..type = type ?? this.type
      ..typeImgUrl = typeImgUrl ?? this.typeImgUrl
      ..images = images ?? this.images;
  }
}