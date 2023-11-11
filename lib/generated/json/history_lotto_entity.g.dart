import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';

HistoryLottoEntity $HistoryLottoEntityFromJson(Map<String, dynamic> json) {
  final HistoryLottoEntity historyLottoEntity = HistoryLottoEntity();
  final int? qiShu = jsonConvert.convert<int>(json['qiShu']);
  if (qiShu != null) {
    historyLottoEntity.qiShu = qiShu;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    historyLottoEntity.time = time;
  }
  final String? balls = jsonConvert.convert<String>(json['balls']);
  if (balls != null) {
    historyLottoEntity.balls = balls;
  }
  return historyLottoEntity;
}

Map<String, dynamic> $HistoryLottoEntityToJson(HistoryLottoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['qiShu'] = entity.qiShu;
  data['time'] = entity.time;
  data['balls'] = entity.balls;
  return data;
}

extension HistoryLottoEntityExtension on HistoryLottoEntity {
  HistoryLottoEntity copyWith({
    int? qiShu,
    String? time,
    String? balls,
  }) {
    return HistoryLottoEntity()
      ..qiShu = qiShu ?? this.qiShu
      ..time = time ?? this.time
      ..balls = balls ?? this.balls;
  }
}