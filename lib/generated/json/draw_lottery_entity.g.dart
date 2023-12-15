import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/draw_lottery_entity.dart';

DrawLotteryEntity $DrawLotteryEntityFromJson(Map<String, dynamic> json) {
  final DrawLotteryEntity drawLotteryEntity = DrawLotteryEntity();
  final int? billCount = jsonConvert.convert<int>(json['billCount']);
  if (billCount != null) {
    drawLotteryEntity.billCount = billCount;
  }
  final int? closeTime = jsonConvert.convert<int>(json['closeTime']);
  if (closeTime != null) {
    drawLotteryEntity.closeTime = closeTime;
  }
  final String? luckyNum = jsonConvert.convert<String>(json['luckyNum']);
  if (luckyNum != null) {
    drawLotteryEntity.luckyNum = luckyNum;
  }
  final int? openTime = jsonConvert.convert<int>(json['openTime']);
  if (openTime != null) {
    drawLotteryEntity.openTime = openTime;
  }
  final String? originalNum = jsonConvert.convert<String>(json['originalNum']);
  if (originalNum != null) {
    drawLotteryEntity.originalNum = originalNum;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    drawLotteryEntity.state = state;
  }
  final int? term = jsonConvert.convert<int>(json['term']);
  if (term != null) {
    drawLotteryEntity.term = term;
  }
  return drawLotteryEntity;
}

Map<String, dynamic> $DrawLotteryEntityToJson(DrawLotteryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['billCount'] = entity.billCount;
  data['closeTime'] = entity.closeTime;
  data['luckyNum'] = entity.luckyNum;
  data['openTime'] = entity.openTime;
  data['originalNum'] = entity.originalNum;
  data['state'] = entity.state;
  data['term'] = entity.term;
  return data;
}

extension DrawLotteryEntityExtension on DrawLotteryEntity {
  DrawLotteryEntity copyWith({
    int? billCount,
    int? closeTime,
    String? luckyNum,
    int? openTime,
    String? originalNum,
    int? state,
    int? term,
  }) {
    return DrawLotteryEntity()
      ..billCount = billCount ?? this.billCount
      ..closeTime = closeTime ?? this.closeTime
      ..luckyNum = luckyNum ?? this.luckyNum
      ..openTime = openTime ?? this.openTime
      ..originalNum = originalNum ?? this.originalNum
      ..state = state ?? this.state
      ..term = term ?? this.term;
  }
}