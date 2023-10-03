import '../../../../utils/formatter.dart';
import '../../../../utils/history.dart';

class BetRecordData {
  List<Bets>? bets;
  String? totalBet;
  String? totalBetValid;
  String? totalBetWin;
  BetRecordData({this.bets});

  get totalBet2fixString {
    return to2fixNumber(totalBet);
  }

  get totalBetValid2fixString {
    return to2fixNumber(totalBetValid);
  }

  get totalBetWin2fixString {
    return to2fixNumber(totalBetWin);
  }

  BetRecordData.fromJson(Map<String, dynamic> json) {
    if (json['bets'] != null) {
      bets = <Bets>[];
      json['bets'].forEach((v) {
        bets!.add(new Bets.fromJson(v));
      });
    }
    totalBet = '${json['total_bet'] ?? '0'}';
    totalBetValid = '${json['total_bet_valid'] ?? '0'}';
    totalBetWin = '${json['total_bet_win'] ?? '0'}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bets != null) {
      data['bets'] = this.bets!.map((v) => v.toJson()).toList();
    }
    data['total_bet'] = this.totalBet;
    data['total_bet_valid'] = this.totalBetValid;
    data['total_bet_win'] = this.totalBetWin;
    return data;
  }
}

class Bets {
  int? id;
  int? game_id;
  String? game_tag;
  String? name_cn;
  int? type;
  String? betSum;
  String? betValid;
  String? betWin;
  String? game_name;

  Bets(
      {this.id,
      this.game_id,
      this.game_tag,
      this.name_cn,
      this.type,
      this.betSum,
      this.betWin,
      this.game_name});

  Bets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    game_id = json['game_id'];
    game_tag = json['game_tag'];
    name_cn = json['name_cn'];
    betSum = json['bet_sum'];
    betValid = json['bet_valid'];
    betWin = json['bet_win'];
    type = json['type'];
    game_name = (json['game_name'] ?? "").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_id'] = this.game_id;
    data['game_tag'] = this.game_tag;
    data['name_cn'] = this.name_cn;
    data['bet_sum'] = this.betSum;
    data['bet_valid'] = this.betValid;
    data['bet_win'] = this.betWin;
    data['type'] = this.type;
    data['game_name'] = this.game_name;
    return data;
  }

  ///是否有效投注
  bool get isHasBet {
    if (betSum == null || betSum!.isEmpty) return false;
    double betSumDouble = double.tryParse(betSum!) ?? 0;
    return betSumDouble > 0;
  }

  ///type分类的类别名
  get typeTitle {
    return getCommonGameTypeTitle(type);
  }

  get betSumDouble {
    if (betSum == null || betSum!.isEmpty) return 0;
    return double.tryParse(betSum!) ?? 0;
  }

  get betValidDouble {
    if (betValid == null || betValid!.isEmpty) return 0;
    return double.tryParse(betValid!) ?? 0;
  }

  get betWinDouble {
    if (betWin == null || betWin!.isEmpty) return 0;
    return double.tryParse(betWin!) ?? 0;
  }
}
