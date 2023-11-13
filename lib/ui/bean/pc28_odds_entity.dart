import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/pc28_odds_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/pc28_odds_entity.g.dart';


@JsonSerializable()
class Pc28Odds11 {
	@JSONField(name: "third_odd")
	Pc28OddsOdd? thirdOdd;
	@JSONField(name: "third_even")
	Pc28OddsOdd? thirdEven;
	@JSONField(name: "third_big")
	Pc28OddsOdd? thirdBig;
	@JSONField(name: "third_small")
	Pc28OddsOdd? thirdSmall;

	Pc28Odds11();

	factory Pc28Odds11.fromJson(Map<String, dynamic> json) => $Pc28Odds11FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds11ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28OddsOdd {
	String? play;
	int? createTime;
	String? name;
	int? tableId;
	dynamic updateTime;
	int? id;
	String? type;
	int? enabled;
	int? parentId;

	Pc28OddsOdd();

	factory Pc28OddsOdd.fromJson(Map<String, dynamic> json) => $Pc28OddsOddFromJson(json);

	Map<String, dynamic> toJson() => $Pc28OddsOddToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds12 {
	@JSONField(name: "first_cao_9")
	Pc28OddsOdd? firstCao9;
	@JSONField(name: "first_cao_8")
	Pc28OddsOdd? firstCao8;
	@JSONField(name: "first_cao_7")
	Pc28OddsOdd? firstCao7;
	@JSONField(name: "first_cao_6")
	Pc28OddsOdd? firstCao6;
	@JSONField(name: "first_cao_5")
	Pc28OddsOdd? firstCao5;
	@JSONField(name: "first_cao_4")
	Pc28OddsOdd? firstCao4;
	@JSONField(name: "first_cao_3")
	Pc28OddsOdd? firstCao3;
	@JSONField(name: "first_cao_2")
	Pc28OddsOdd? firstCao2;
	@JSONField(name: "first_cao_1")
	Pc28OddsOdd? firstCao1;
	@JSONField(name: "first_cao_0")
	Pc28OddsOdd? firstCao0;

	Pc28Odds12();

	factory Pc28Odds12.fromJson(Map<String, dynamic> json) => $Pc28Odds12FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds12ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds13 {
	@JSONField(name: "second_cao_1")
	Pc28OddsOdd? secondCao1;
	@JSONField(name: "second_cao_2")
	Pc28OddsOdd? secondCao2;
	@JSONField(name: "second_cao_3")
	Pc28OddsOdd? secondCao3;
	@JSONField(name: "second_cao_4")
	Pc28OddsOdd? secondCao4;
	@JSONField(name: "second_cao_5")
	Pc28OddsOdd? secondCao5;
	@JSONField(name: "second_cao_6")
	Pc28OddsOdd? secondCao6;
	@JSONField(name: "second_cao_7")
	Pc28OddsOdd? secondCao7;
	@JSONField(name: "second_cao_8")
	Pc28OddsOdd? secondCao8;
	@JSONField(name: "second_cao_9")
	Pc28OddsOdd? secondCao9;
	@JSONField(name: "second_cao_0")
	Pc28OddsOdd? secondCao0;

	Pc28Odds13();

	factory Pc28Odds13.fromJson(Map<String, dynamic> json) => $Pc28Odds13FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds13ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28Odds14 {
	@JSONField(name: "third_cao_0")
	Pc28OddsOdd? thirdCao0;
	@JSONField(name: "third_cao_1")
	Pc28OddsOdd? thirdCao1;
	@JSONField(name: "third_cao_4")
	Pc28OddsOdd? thirdCao4;
	@JSONField(name: "third_cao_5")
	Pc28OddsOdd? thirdCao5;
	@JSONField(name: "third_cao_2")
	Pc28OddsOdd? thirdCao2;
	@JSONField(name: "third_cao_3")
	Pc28OddsOdd? thirdCao3;
	@JSONField(name: "third_cao_8")
	Pc28OddsOdd? thirdCao8;
	@JSONField(name: "third_cao_9")
	Pc28OddsOdd? thirdCao9;
	@JSONField(name: "third_cao_6")
	Pc28OddsOdd? thirdCao6;
	@JSONField(name: "third_cao_7")
	Pc28OddsOdd? thirdCao7;

	Pc28Odds14();

	factory Pc28Odds14.fromJson(Map<String, dynamic> json) => $Pc28Odds14FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds14ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28Odds15 {
	Pc28OddsOdd? equal;
	Pc28OddsOdd? dragon;
	Pc28OddsOdd? tiger;

	Pc28Odds15();

	factory Pc28Odds15.fromJson(Map<String, dynamic> json) => $Pc28Odds15FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds15ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds2 {
	Pc28OddsOdd? min;
	Pc28OddsOdd? max;

	Pc28Odds2();

	factory Pc28Odds2.fromJson(Map<String, dynamic> json) => $Pc28Odds2FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds2ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds4 {
	@JSONField(name: "small_odd")
	Pc28OddsOdd? smallOdd;
	@JSONField(name: "big_even")
	Pc28OddsOdd? bigEven;
	@JSONField(name: "big_odd")
	Pc28OddsOdd? bigOdd;
	@JSONField(name: "small_even")
	Pc28OddsOdd? smallEven;

	Pc28Odds4();

	factory Pc28Odds4.fromJson(Map<String, dynamic> json) => $Pc28Odds4FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds4ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds5 {
	@JSONField(name: "13_small")
	Pc28OddsOdd? x13Small;
	@JSONField(name: "14_even")
	Pc28OddsOdd? x14Even;
	@JSONField(name: "14_big")
	Pc28OddsOdd? x14Big;
	@JSONField(name: "13_odd")
	Pc28OddsOdd? x13Odd;

	Pc28Odds5();

	factory Pc28Odds5.fromJson(Map<String, dynamic> json) => $Pc28Odds5FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds5ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds6 {
	@JSONField(name: "14_big_even")
	Pc28OddsOdd? x14BigEven;
	@JSONField(name: "13_small_odd")
	Pc28OddsOdd? x13SmallOdd;

	Pc28Odds6();

	factory Pc28Odds6.fromJson(Map<String, dynamic> json) => $Pc28Odds6FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds6ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds7 {
	Pc28OddsOdd? straight;
	Pc28OddsOdd? leopard;
	Pc28OddsOdd? pair;

	Pc28Odds7();

	factory Pc28Odds7.fromJson(Map<String, dynamic> json) => $Pc28Odds7FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds7ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds8 {
	Pc28OddsOdd? red;
	Pc28OddsOdd? green;
	Pc28OddsOdd? blue;

	Pc28Odds8();

	factory Pc28Odds8.fromJson(Map<String, dynamic> json) => $Pc28Odds8FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds8ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28Odds9 {
	@JSONField(name: "first_odd")
	Pc28OddsOdd? firstOdd;
	@JSONField(name: "first_big")
	Pc28OddsOdd? firstBig;
	@JSONField(name: "first_even")
	Pc28OddsOdd? firstEven;
	@JSONField(name: "first_small")
	Pc28OddsOdd? firstSmall;

	Pc28Odds9();

	factory Pc28Odds9.fromJson(Map<String, dynamic> json) => $Pc28Odds9FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds9ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class Pc28Odds10 {
	@JSONField(name: "second_small")
	Pc28OddsOdd? secondSmall;
	@JSONField(name: "second_odd")
	Pc28OddsOdd? secondOdd;
	@JSONField(name: "second_big")
	Pc28OddsOdd? secondBig;
	@JSONField(name: "second_even")
	Pc28OddsOdd? secondEven;

	Pc28Odds10();

	factory Pc28Odds10.fromJson(Map<String, dynamic> json) => $Pc28Odds10FromJson(json);

	Map<String, dynamic> toJson() => $Pc28Odds10ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
