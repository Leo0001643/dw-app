import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';


CountDownLotteryEntity $CountDownLotteryEntityFromJson(
    Map<String, dynamic> json) {
  final CountDownLotteryEntity countDownLotteryEntity = CountDownLotteryEntity();
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    countDownLotteryEntity.time = time;
  }
  final String? term = jsonConvert.convert<String>(json['term']);
  if (term != null) {
    countDownLotteryEntity.term = term;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    countDownLotteryEntity.title = title;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    countDownLotteryEntity.type = type;
  }
  final String? subTitile = jsonConvert.convert<String>(json['subTitile']);
  if (subTitile != null) {
    countDownLotteryEntity.subTitile = subTitile;
  }
  final int? titleColor = jsonConvert.convert<int>(json['titleColor']);
  if (titleColor != null) {
    countDownLotteryEntity.titleColor = titleColor;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    countDownLotteryEntity.status = status;
  }
  return countDownLotteryEntity;
}

Map<String, dynamic> $CountDownLotteryEntityToJson(
    CountDownLotteryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['term'] = entity.term;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['subTitile'] = entity.subTitile;
  data['titleColor'] = entity.titleColor;
  data['status'] = entity.status;
  return data;
}

extension CountDownLotteryEntityExtension on CountDownLotteryEntity {
  CountDownLotteryEntity copyWith({
    int? time,
    String? term,
    String? title,
    String? type,
    String? subTitile,
    int? titleColor,
    String? status,
  }) {
    return CountDownLotteryEntity()
      ..time = time ?? this.time
      ..term = term ?? this.term
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..subTitile = subTitile ?? this.subTitile
      ..titleColor = titleColor ?? this.titleColor
      ..status = status ?? this.status;
  }
}