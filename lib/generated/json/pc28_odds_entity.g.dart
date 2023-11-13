import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pc28_odds_entity.dart';

Pc28Odds11 $Pc28Odds11FromJson(Map<String, dynamic> json) {
  final Pc28Odds11 pc28Odds11 = Pc28Odds11();
  final Pc28OddsOdd? thirdOdd = jsonConvert.convert<Pc28OddsOdd>(
      json['third_odd']);
  if (thirdOdd != null) {
    pc28Odds11.thirdOdd = thirdOdd;
  }
  final Pc28OddsOdd? thirdEven = jsonConvert.convert<Pc28OddsOdd>(
      json['third_even']);
  if (thirdEven != null) {
    pc28Odds11.thirdEven = thirdEven;
  }
  final Pc28OddsOdd? thirdBig = jsonConvert.convert<Pc28OddsOdd>(
      json['third_big']);
  if (thirdBig != null) {
    pc28Odds11.thirdBig = thirdBig;
  }
  final Pc28OddsOdd? thirdSmall = jsonConvert.convert<Pc28OddsOdd>(
      json['third_small']);
  if (thirdSmall != null) {
    pc28Odds11.thirdSmall = thirdSmall;
  }
  return pc28Odds11;
}

Map<String, dynamic> $Pc28Odds11ToJson(Pc28Odds11 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['third_odd'] = entity.thirdOdd?.toJson();
  data['third_even'] = entity.thirdEven?.toJson();
  data['third_big'] = entity.thirdBig?.toJson();
  data['third_small'] = entity.thirdSmall?.toJson();
  return data;
}

extension Pc28Odds11Extension on Pc28Odds11 {
  Pc28Odds11 copyWith({
    Pc28OddsOdd? thirdOdd,
    Pc28OddsOdd? thirdEven,
    Pc28OddsOdd? thirdBig,
    Pc28OddsOdd? thirdSmall,
  }) {
    return Pc28Odds11()
      ..thirdOdd = thirdOdd ?? this.thirdOdd
      ..thirdEven = thirdEven ?? this.thirdEven
      ..thirdBig = thirdBig ?? this.thirdBig
      ..thirdSmall = thirdSmall ?? this.thirdSmall;
  }
}

Pc28OddsOdd $Pc28OddsOddFromJson(Map<String, dynamic> json) {
  final Pc28OddsOdd pc28OddsOdd = Pc28OddsOdd();
  final String? play = jsonConvert.convert<String>(json['play']);
  if (play != null) {
    pc28OddsOdd.play = play;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pc28OddsOdd.createTime = createTime;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pc28OddsOdd.name = name;
  }
  final int? tableId = jsonConvert.convert<int>(json['tableId']);
  if (tableId != null) {
    pc28OddsOdd.tableId = tableId;
  }
  final dynamic updateTime = json['updateTime'];
  if (updateTime != null) {
    pc28OddsOdd.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pc28OddsOdd.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    pc28OddsOdd.type = type;
  }
  final int? enabled = jsonConvert.convert<int>(json['enabled']);
  if (enabled != null) {
    pc28OddsOdd.enabled = enabled;
  }
  final int? parentId = jsonConvert.convert<int>(json['parentId']);
  if (parentId != null) {
    pc28OddsOdd.parentId = parentId;
  }
  return pc28OddsOdd;
}

Map<String, dynamic> $Pc28OddsOddToJson(Pc28OddsOdd entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['play'] = entity.play;
  data['createTime'] = entity.createTime;
  data['name'] = entity.name;
  data['tableId'] = entity.tableId;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['enabled'] = entity.enabled;
  data['parentId'] = entity.parentId;
  return data;
}

extension Pc28OddsOddExtension on Pc28OddsOdd {
  Pc28OddsOdd copyWith({
    String? play,
    int? createTime,
    String? name,
    int? tableId,
    dynamic updateTime,
    int? id,
    String? type,
    int? enabled,
    int? parentId,
  }) {
    return Pc28OddsOdd()
      ..play = play ?? this.play
      ..createTime = createTime ?? this.createTime
      ..name = name ?? this.name
      ..tableId = tableId ?? this.tableId
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..enabled = enabled ?? this.enabled
      ..parentId = parentId ?? this.parentId;
  }
}

Pc28Odds12 $Pc28Odds12FromJson(Map<String, dynamic> json) {
  final Pc28Odds12 pc28Odds12 = Pc28Odds12();
  final Pc28OddsOdd? firstCao9 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_9']);
  if (firstCao9 != null) {
    pc28Odds12.firstCao9 = firstCao9;
  }
  final Pc28OddsOdd? firstCao8 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_8']);
  if (firstCao8 != null) {
    pc28Odds12.firstCao8 = firstCao8;
  }
  final Pc28OddsOdd? firstCao7 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_7']);
  if (firstCao7 != null) {
    pc28Odds12.firstCao7 = firstCao7;
  }
  final Pc28OddsOdd? firstCao6 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_6']);
  if (firstCao6 != null) {
    pc28Odds12.firstCao6 = firstCao6;
  }
  final Pc28OddsOdd? firstCao5 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_5']);
  if (firstCao5 != null) {
    pc28Odds12.firstCao5 = firstCao5;
  }
  final Pc28OddsOdd? firstCao4 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_4']);
  if (firstCao4 != null) {
    pc28Odds12.firstCao4 = firstCao4;
  }
  final Pc28OddsOdd? firstCao3 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_3']);
  if (firstCao3 != null) {
    pc28Odds12.firstCao3 = firstCao3;
  }
  final Pc28OddsOdd? firstCao2 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_2']);
  if (firstCao2 != null) {
    pc28Odds12.firstCao2 = firstCao2;
  }
  final Pc28OddsOdd? firstCao1 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_1']);
  if (firstCao1 != null) {
    pc28Odds12.firstCao1 = firstCao1;
  }
  final Pc28OddsOdd? firstCao0 = jsonConvert.convert<Pc28OddsOdd>(
      json['first_cao_0']);
  if (firstCao0 != null) {
    pc28Odds12.firstCao0 = firstCao0;
  }
  return pc28Odds12;
}

Map<String, dynamic> $Pc28Odds12ToJson(Pc28Odds12 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['first_cao_9'] = entity.firstCao9?.toJson();
  data['first_cao_8'] = entity.firstCao8?.toJson();
  data['first_cao_7'] = entity.firstCao7?.toJson();
  data['first_cao_6'] = entity.firstCao6?.toJson();
  data['first_cao_5'] = entity.firstCao5?.toJson();
  data['first_cao_4'] = entity.firstCao4?.toJson();
  data['first_cao_3'] = entity.firstCao3?.toJson();
  data['first_cao_2'] = entity.firstCao2?.toJson();
  data['first_cao_1'] = entity.firstCao1?.toJson();
  data['first_cao_0'] = entity.firstCao0?.toJson();
  return data;
}

extension Pc28Odds12Extension on Pc28Odds12 {
  Pc28Odds12 copyWith({
    Pc28OddsOdd? firstCao9,
    Pc28OddsOdd? firstCao8,
    Pc28OddsOdd? firstCao7,
    Pc28OddsOdd? firstCao6,
    Pc28OddsOdd? firstCao5,
    Pc28OddsOdd? firstCao4,
    Pc28OddsOdd? firstCao3,
    Pc28OddsOdd? firstCao2,
    Pc28OddsOdd? firstCao1,
    Pc28OddsOdd? firstCao0,
  }) {
    return Pc28Odds12()
      ..firstCao9 = firstCao9 ?? this.firstCao9
      ..firstCao8 = firstCao8 ?? this.firstCao8
      ..firstCao7 = firstCao7 ?? this.firstCao7
      ..firstCao6 = firstCao6 ?? this.firstCao6
      ..firstCao5 = firstCao5 ?? this.firstCao5
      ..firstCao4 = firstCao4 ?? this.firstCao4
      ..firstCao3 = firstCao3 ?? this.firstCao3
      ..firstCao2 = firstCao2 ?? this.firstCao2
      ..firstCao1 = firstCao1 ?? this.firstCao1
      ..firstCao0 = firstCao0 ?? this.firstCao0;
  }
}

Pc28Odds13 $Pc28Odds13FromJson(Map<String, dynamic> json) {
  final Pc28Odds13 pc28Odds13 = Pc28Odds13();
  final Pc28OddsOdd? secondCao1 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_1']);
  if (secondCao1 != null) {
    pc28Odds13.secondCao1 = secondCao1;
  }
  final Pc28OddsOdd? secondCao2 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_2']);
  if (secondCao2 != null) {
    pc28Odds13.secondCao2 = secondCao2;
  }
  final Pc28OddsOdd? secondCao3 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_3']);
  if (secondCao3 != null) {
    pc28Odds13.secondCao3 = secondCao3;
  }
  final Pc28OddsOdd? secondCao4 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_4']);
  if (secondCao4 != null) {
    pc28Odds13.secondCao4 = secondCao4;
  }
  final Pc28OddsOdd? secondCao5 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_5']);
  if (secondCao5 != null) {
    pc28Odds13.secondCao5 = secondCao5;
  }
  final Pc28OddsOdd? secondCao6 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_6']);
  if (secondCao6 != null) {
    pc28Odds13.secondCao6 = secondCao6;
  }
  final Pc28OddsOdd? secondCao7 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_7']);
  if (secondCao7 != null) {
    pc28Odds13.secondCao7 = secondCao7;
  }
  final Pc28OddsOdd? secondCao8 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_8']);
  if (secondCao8 != null) {
    pc28Odds13.secondCao8 = secondCao8;
  }
  final Pc28OddsOdd? secondCao9 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_9']);
  if (secondCao9 != null) {
    pc28Odds13.secondCao9 = secondCao9;
  }
  final Pc28OddsOdd? secondCao0 = jsonConvert.convert<Pc28OddsOdd>(
      json['second_cao_0']);
  if (secondCao0 != null) {
    pc28Odds13.secondCao0 = secondCao0;
  }
  return pc28Odds13;
}

Map<String, dynamic> $Pc28Odds13ToJson(Pc28Odds13 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['second_cao_1'] = entity.secondCao1?.toJson();
  data['second_cao_2'] = entity.secondCao2?.toJson();
  data['second_cao_3'] = entity.secondCao3?.toJson();
  data['second_cao_4'] = entity.secondCao4?.toJson();
  data['second_cao_5'] = entity.secondCao5?.toJson();
  data['second_cao_6'] = entity.secondCao6?.toJson();
  data['second_cao_7'] = entity.secondCao7?.toJson();
  data['second_cao_8'] = entity.secondCao8?.toJson();
  data['second_cao_9'] = entity.secondCao9?.toJson();
  data['second_cao_0'] = entity.secondCao0?.toJson();
  return data;
}

extension Pc28Odds13Extension on Pc28Odds13 {
  Pc28Odds13 copyWith({
    Pc28OddsOdd? secondCao1,
    Pc28OddsOdd? secondCao2,
    Pc28OddsOdd? secondCao3,
    Pc28OddsOdd? secondCao4,
    Pc28OddsOdd? secondCao5,
    Pc28OddsOdd? secondCao6,
    Pc28OddsOdd? secondCao7,
    Pc28OddsOdd? secondCao8,
    Pc28OddsOdd? secondCao9,
    Pc28OddsOdd? secondCao0,
  }) {
    return Pc28Odds13()
      ..secondCao1 = secondCao1 ?? this.secondCao1
      ..secondCao2 = secondCao2 ?? this.secondCao2
      ..secondCao3 = secondCao3 ?? this.secondCao3
      ..secondCao4 = secondCao4 ?? this.secondCao4
      ..secondCao5 = secondCao5 ?? this.secondCao5
      ..secondCao6 = secondCao6 ?? this.secondCao6
      ..secondCao7 = secondCao7 ?? this.secondCao7
      ..secondCao8 = secondCao8 ?? this.secondCao8
      ..secondCao9 = secondCao9 ?? this.secondCao9
      ..secondCao0 = secondCao0 ?? this.secondCao0;
  }
}

Pc28Odds14 $Pc28Odds14FromJson(Map<String, dynamic> json) {
  final Pc28Odds14 pc28Odds14 = Pc28Odds14();
  final Pc28OddsOdd? thirdCao0 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_0']);
  if (thirdCao0 != null) {
    pc28Odds14.thirdCao0 = thirdCao0;
  }
  final Pc28OddsOdd? thirdCao1 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_1']);
  if (thirdCao1 != null) {
    pc28Odds14.thirdCao1 = thirdCao1;
  }
  final Pc28OddsOdd? thirdCao4 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_4']);
  if (thirdCao4 != null) {
    pc28Odds14.thirdCao4 = thirdCao4;
  }
  final Pc28OddsOdd? thirdCao5 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_5']);
  if (thirdCao5 != null) {
    pc28Odds14.thirdCao5 = thirdCao5;
  }
  final Pc28OddsOdd? thirdCao2 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_2']);
  if (thirdCao2 != null) {
    pc28Odds14.thirdCao2 = thirdCao2;
  }
  final Pc28OddsOdd? thirdCao3 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_3']);
  if (thirdCao3 != null) {
    pc28Odds14.thirdCao3 = thirdCao3;
  }
  final Pc28OddsOdd? thirdCao8 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_8']);
  if (thirdCao8 != null) {
    pc28Odds14.thirdCao8 = thirdCao8;
  }
  final Pc28OddsOdd? thirdCao9 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_9']);
  if (thirdCao9 != null) {
    pc28Odds14.thirdCao9 = thirdCao9;
  }
  final Pc28OddsOdd? thirdCao6 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_6']);
  if (thirdCao6 != null) {
    pc28Odds14.thirdCao6 = thirdCao6;
  }
  final Pc28OddsOdd? thirdCao7 = jsonConvert.convert<Pc28OddsOdd>(
      json['third_cao_7']);
  if (thirdCao7 != null) {
    pc28Odds14.thirdCao7 = thirdCao7;
  }
  return pc28Odds14;
}

Map<String, dynamic> $Pc28Odds14ToJson(Pc28Odds14 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['third_cao_0'] = entity.thirdCao0?.toJson();
  data['third_cao_1'] = entity.thirdCao1?.toJson();
  data['third_cao_4'] = entity.thirdCao4?.toJson();
  data['third_cao_5'] = entity.thirdCao5?.toJson();
  data['third_cao_2'] = entity.thirdCao2?.toJson();
  data['third_cao_3'] = entity.thirdCao3?.toJson();
  data['third_cao_8'] = entity.thirdCao8?.toJson();
  data['third_cao_9'] = entity.thirdCao9?.toJson();
  data['third_cao_6'] = entity.thirdCao6?.toJson();
  data['third_cao_7'] = entity.thirdCao7?.toJson();
  return data;
}

extension Pc28Odds14Extension on Pc28Odds14 {
  Pc28Odds14 copyWith({
    Pc28OddsOdd? thirdCao0,
    Pc28OddsOdd? thirdCao1,
    Pc28OddsOdd? thirdCao4,
    Pc28OddsOdd? thirdCao5,
    Pc28OddsOdd? thirdCao2,
    Pc28OddsOdd? thirdCao3,
    Pc28OddsOdd? thirdCao8,
    Pc28OddsOdd? thirdCao9,
    Pc28OddsOdd? thirdCao6,
    Pc28OddsOdd? thirdCao7,
  }) {
    return Pc28Odds14()
      ..thirdCao0 = thirdCao0 ?? this.thirdCao0
      ..thirdCao1 = thirdCao1 ?? this.thirdCao1
      ..thirdCao4 = thirdCao4 ?? this.thirdCao4
      ..thirdCao5 = thirdCao5 ?? this.thirdCao5
      ..thirdCao2 = thirdCao2 ?? this.thirdCao2
      ..thirdCao3 = thirdCao3 ?? this.thirdCao3
      ..thirdCao8 = thirdCao8 ?? this.thirdCao8
      ..thirdCao9 = thirdCao9 ?? this.thirdCao9
      ..thirdCao6 = thirdCao6 ?? this.thirdCao6
      ..thirdCao7 = thirdCao7 ?? this.thirdCao7;
  }
}

Pc28Odds15 $Pc28Odds15FromJson(Map<String, dynamic> json) {
  final Pc28Odds15 pc28Odds15 = Pc28Odds15();
  final Pc28OddsOdd? equal = jsonConvert.convert<Pc28OddsOdd>(json['equal']);
  if (equal != null) {
    pc28Odds15.equal = equal;
  }
  final Pc28OddsOdd? dragon = jsonConvert.convert<Pc28OddsOdd>(json['dragon']);
  if (dragon != null) {
    pc28Odds15.dragon = dragon;
  }
  final Pc28OddsOdd? tiger = jsonConvert.convert<Pc28OddsOdd>(json['tiger']);
  if (tiger != null) {
    pc28Odds15.tiger = tiger;
  }
  return pc28Odds15;
}

Map<String, dynamic> $Pc28Odds15ToJson(Pc28Odds15 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['equal'] = entity.equal?.toJson();
  data['dragon'] = entity.dragon?.toJson();
  data['tiger'] = entity.tiger?.toJson();
  return data;
}

extension Pc28Odds15Extension on Pc28Odds15 {
  Pc28Odds15 copyWith({
    Pc28OddsOdd? equal,
    Pc28OddsOdd? dragon,
    Pc28OddsOdd? tiger,
  }) {
    return Pc28Odds15()
      ..equal = equal ?? this.equal
      ..dragon = dragon ?? this.dragon
      ..tiger = tiger ?? this.tiger;
  }
}

Pc28Odds2 $Pc28Odds2FromJson(Map<String, dynamic> json) {
  final Pc28Odds2 pc28Odds2 = Pc28Odds2();
  final Pc28OddsOdd? min = jsonConvert.convert<Pc28OddsOdd>(json['min']);
  if (min != null) {
    pc28Odds2.min = min;
  }
  final Pc28OddsOdd? max = jsonConvert.convert<Pc28OddsOdd>(json['max']);
  if (max != null) {
    pc28Odds2.max = max;
  }
  return pc28Odds2;
}

Map<String, dynamic> $Pc28Odds2ToJson(Pc28Odds2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['min'] = entity.min?.toJson();
  data['max'] = entity.max?.toJson();
  return data;
}

extension Pc28Odds2Extension on Pc28Odds2 {
  Pc28Odds2 copyWith({
    Pc28OddsOdd? min,
    Pc28OddsOdd? max,
  }) {
    return Pc28Odds2()
      ..min = min ?? this.min
      ..max = max ?? this.max;
  }
}

Pc28Odds4 $Pc28Odds4FromJson(Map<String, dynamic> json) {
  final Pc28Odds4 pc28Odds4 = Pc28Odds4();
  final Pc28OddsOdd? smallOdd = jsonConvert.convert<Pc28OddsOdd>(
      json['small_odd']);
  if (smallOdd != null) {
    pc28Odds4.smallOdd = smallOdd;
  }
  final Pc28OddsOdd? bigEven = jsonConvert.convert<Pc28OddsOdd>(
      json['big_even']);
  if (bigEven != null) {
    pc28Odds4.bigEven = bigEven;
  }
  final Pc28OddsOdd? bigOdd = jsonConvert.convert<Pc28OddsOdd>(json['big_odd']);
  if (bigOdd != null) {
    pc28Odds4.bigOdd = bigOdd;
  }
  final Pc28OddsOdd? smallEven = jsonConvert.convert<Pc28OddsOdd>(
      json['small_even']);
  if (smallEven != null) {
    pc28Odds4.smallEven = smallEven;
  }
  return pc28Odds4;
}

Map<String, dynamic> $Pc28Odds4ToJson(Pc28Odds4 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['small_odd'] = entity.smallOdd?.toJson();
  data['big_even'] = entity.bigEven?.toJson();
  data['big_odd'] = entity.bigOdd?.toJson();
  data['small_even'] = entity.smallEven?.toJson();
  return data;
}

extension Pc28Odds4Extension on Pc28Odds4 {
  Pc28Odds4 copyWith({
    Pc28OddsOdd? smallOdd,
    Pc28OddsOdd? bigEven,
    Pc28OddsOdd? bigOdd,
    Pc28OddsOdd? smallEven,
  }) {
    return Pc28Odds4()
      ..smallOdd = smallOdd ?? this.smallOdd
      ..bigEven = bigEven ?? this.bigEven
      ..bigOdd = bigOdd ?? this.bigOdd
      ..smallEven = smallEven ?? this.smallEven;
  }
}

Pc28Odds5 $Pc28Odds5FromJson(Map<String, dynamic> json) {
  final Pc28Odds5 pc28Odds5 = Pc28Odds5();
  final Pc28OddsOdd? x13Small = jsonConvert.convert<Pc28OddsOdd>(
      json['13_small']);
  if (x13Small != null) {
    pc28Odds5.x13Small = x13Small;
  }
  final Pc28OddsOdd? x14Even = jsonConvert.convert<Pc28OddsOdd>(
      json['14_even']);
  if (x14Even != null) {
    pc28Odds5.x14Even = x14Even;
  }
  final Pc28OddsOdd? x14Big = jsonConvert.convert<Pc28OddsOdd>(json['14_big']);
  if (x14Big != null) {
    pc28Odds5.x14Big = x14Big;
  }
  final Pc28OddsOdd? x13Odd = jsonConvert.convert<Pc28OddsOdd>(json['13_odd']);
  if (x13Odd != null) {
    pc28Odds5.x13Odd = x13Odd;
  }
  return pc28Odds5;
}

Map<String, dynamic> $Pc28Odds5ToJson(Pc28Odds5 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['13_small'] = entity.x13Small?.toJson();
  data['14_even'] = entity.x14Even?.toJson();
  data['14_big'] = entity.x14Big?.toJson();
  data['13_odd'] = entity.x13Odd?.toJson();
  return data;
}

extension Pc28Odds5Extension on Pc28Odds5 {
  Pc28Odds5 copyWith({
    Pc28OddsOdd? x13Small,
    Pc28OddsOdd? x14Even,
    Pc28OddsOdd? x14Big,
    Pc28OddsOdd? x13Odd,
  }) {
    return Pc28Odds5()
      ..x13Small = x13Small ?? this.x13Small
      ..x14Even = x14Even ?? this.x14Even
      ..x14Big = x14Big ?? this.x14Big
      ..x13Odd = x13Odd ?? this.x13Odd;
  }
}

Pc28Odds6 $Pc28Odds6FromJson(Map<String, dynamic> json) {
  final Pc28Odds6 pc28Odds6 = Pc28Odds6();
  final Pc28OddsOdd? x14BigEven = jsonConvert.convert<Pc28OddsOdd>(
      json['14_big_even']);
  if (x14BigEven != null) {
    pc28Odds6.x14BigEven = x14BigEven;
  }
  final Pc28OddsOdd? x13SmallOdd = jsonConvert.convert<Pc28OddsOdd>(
      json['13_small_odd']);
  if (x13SmallOdd != null) {
    pc28Odds6.x13SmallOdd = x13SmallOdd;
  }
  return pc28Odds6;
}

Map<String, dynamic> $Pc28Odds6ToJson(Pc28Odds6 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['14_big_even'] = entity.x14BigEven?.toJson();
  data['13_small_odd'] = entity.x13SmallOdd?.toJson();
  return data;
}

extension Pc28Odds6Extension on Pc28Odds6 {
  Pc28Odds6 copyWith({
    Pc28OddsOdd? x14BigEven,
    Pc28OddsOdd? x13SmallOdd,
  }) {
    return Pc28Odds6()
      ..x14BigEven = x14BigEven ?? this.x14BigEven
      ..x13SmallOdd = x13SmallOdd ?? this.x13SmallOdd;
  }
}

Pc28Odds7 $Pc28Odds7FromJson(Map<String, dynamic> json) {
  final Pc28Odds7 pc28Odds7 = Pc28Odds7();
  final Pc28OddsOdd? straight = jsonConvert.convert<Pc28OddsOdd>(
      json['straight']);
  if (straight != null) {
    pc28Odds7.straight = straight;
  }
  final Pc28OddsOdd? leopard = jsonConvert.convert<Pc28OddsOdd>(
      json['leopard']);
  if (leopard != null) {
    pc28Odds7.leopard = leopard;
  }
  final Pc28OddsOdd? pair = jsonConvert.convert<Pc28OddsOdd>(json['pair']);
  if (pair != null) {
    pc28Odds7.pair = pair;
  }
  return pc28Odds7;
}

Map<String, dynamic> $Pc28Odds7ToJson(Pc28Odds7 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['straight'] = entity.straight?.toJson();
  data['leopard'] = entity.leopard?.toJson();
  data['pair'] = entity.pair?.toJson();
  return data;
}

extension Pc28Odds7Extension on Pc28Odds7 {
  Pc28Odds7 copyWith({
    Pc28OddsOdd? straight,
    Pc28OddsOdd? leopard,
    Pc28OddsOdd? pair,
  }) {
    return Pc28Odds7()
      ..straight = straight ?? this.straight
      ..leopard = leopard ?? this.leopard
      ..pair = pair ?? this.pair;
  }
}

Pc28Odds8 $Pc28Odds8FromJson(Map<String, dynamic> json) {
  final Pc28Odds8 pc28Odds8 = Pc28Odds8();
  final Pc28OddsOdd? red = jsonConvert.convert<Pc28OddsOdd>(json['red']);
  if (red != null) {
    pc28Odds8.red = red;
  }
  final Pc28OddsOdd? green = jsonConvert.convert<Pc28OddsOdd>(json['green']);
  if (green != null) {
    pc28Odds8.green = green;
  }
  final Pc28OddsOdd? blue = jsonConvert.convert<Pc28OddsOdd>(json['blue']);
  if (blue != null) {
    pc28Odds8.blue = blue;
  }
  return pc28Odds8;
}

Map<String, dynamic> $Pc28Odds8ToJson(Pc28Odds8 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['red'] = entity.red?.toJson();
  data['green'] = entity.green?.toJson();
  data['blue'] = entity.blue?.toJson();
  return data;
}

extension Pc28Odds8Extension on Pc28Odds8 {
  Pc28Odds8 copyWith({
    Pc28OddsOdd? red,
    Pc28OddsOdd? green,
    Pc28OddsOdd? blue,
  }) {
    return Pc28Odds8()
      ..red = red ?? this.red
      ..green = green ?? this.green
      ..blue = blue ?? this.blue;
  }
}

Pc28Odds9 $Pc28Odds9FromJson(Map<String, dynamic> json) {
  final Pc28Odds9 pc28Odds9 = Pc28Odds9();
  final Pc28OddsOdd? firstOdd = jsonConvert.convert<Pc28OddsOdd>(
      json['first_odd']);
  if (firstOdd != null) {
    pc28Odds9.firstOdd = firstOdd;
  }
  final Pc28OddsOdd? firstBig = jsonConvert.convert<Pc28OddsOdd>(
      json['first_big']);
  if (firstBig != null) {
    pc28Odds9.firstBig = firstBig;
  }
  final Pc28OddsOdd? firstEven = jsonConvert.convert<Pc28OddsOdd>(
      json['first_even']);
  if (firstEven != null) {
    pc28Odds9.firstEven = firstEven;
  }
  final Pc28OddsOdd? firstSmall = jsonConvert.convert<Pc28OddsOdd>(
      json['first_small']);
  if (firstSmall != null) {
    pc28Odds9.firstSmall = firstSmall;
  }
  return pc28Odds9;
}

Map<String, dynamic> $Pc28Odds9ToJson(Pc28Odds9 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['first_odd'] = entity.firstOdd?.toJson();
  data['first_big'] = entity.firstBig?.toJson();
  data['first_even'] = entity.firstEven?.toJson();
  data['first_small'] = entity.firstSmall?.toJson();
  return data;
}

extension Pc28Odds9Extension on Pc28Odds9 {
  Pc28Odds9 copyWith({
    Pc28OddsOdd? firstOdd,
    Pc28OddsOdd? firstBig,
    Pc28OddsOdd? firstEven,
    Pc28OddsOdd? firstSmall,
  }) {
    return Pc28Odds9()
      ..firstOdd = firstOdd ?? this.firstOdd
      ..firstBig = firstBig ?? this.firstBig
      ..firstEven = firstEven ?? this.firstEven
      ..firstSmall = firstSmall ?? this.firstSmall;
  }
}

Pc28Odds10 $Pc28Odds10FromJson(Map<String, dynamic> json) {
  final Pc28Odds10 pc28Odds10 = Pc28Odds10();
  final Pc28OddsOdd? secondSmall = jsonConvert.convert<Pc28OddsOdd>(
      json['second_small']);
  if (secondSmall != null) {
    pc28Odds10.secondSmall = secondSmall;
  }
  final Pc28OddsOdd? secondOdd = jsonConvert.convert<Pc28OddsOdd>(
      json['second_odd']);
  if (secondOdd != null) {
    pc28Odds10.secondOdd = secondOdd;
  }
  final Pc28OddsOdd? secondBig = jsonConvert.convert<Pc28OddsOdd>(
      json['second_big']);
  if (secondBig != null) {
    pc28Odds10.secondBig = secondBig;
  }
  final Pc28OddsOdd? secondEven = jsonConvert.convert<Pc28OddsOdd>(
      json['second_even']);
  if (secondEven != null) {
    pc28Odds10.secondEven = secondEven;
  }
  return pc28Odds10;
}

Map<String, dynamic> $Pc28Odds10ToJson(Pc28Odds10 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['second_small'] = entity.secondSmall?.toJson();
  data['second_odd'] = entity.secondOdd?.toJson();
  data['second_big'] = entity.secondBig?.toJson();
  data['second_even'] = entity.secondEven?.toJson();
  return data;
}

extension Pc28Odds10Extension on Pc28Odds10 {
  Pc28Odds10 copyWith({
    Pc28OddsOdd? secondSmall,
    Pc28OddsOdd? secondOdd,
    Pc28OddsOdd? secondBig,
    Pc28OddsOdd? secondEven,
  }) {
    return Pc28Odds10()
      ..secondSmall = secondSmall ?? this.secondSmall
      ..secondOdd = secondOdd ?? this.secondOdd
      ..secondBig = secondBig ?? this.secondBig
      ..secondEven = secondEven ?? this.secondEven;
  }
}