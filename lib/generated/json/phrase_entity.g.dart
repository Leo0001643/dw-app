import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/phrase_entity.dart';

PhraseEntity $PhraseEntityFromJson(Map<String, dynamic> json) {
  final PhraseEntity phraseEntity = PhraseEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    phraseEntity.type = type;
  }
  final List<String>? phrases = (json['phrases'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (phrases != null) {
    phraseEntity.phrases = phrases;
  }
  return phraseEntity;
}

Map<String, dynamic> $PhraseEntityToJson(PhraseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['phrases'] = entity.phrases;
  return data;
}

extension PhraseEntityExtension on PhraseEntity {
  PhraseEntity copyWith({
    String? type,
    List<String>? phrases,
  }) {
    return PhraseEntity()
      ..type = type ?? this.type
      ..phrases = phrases ?? this.phrases;
  }
}