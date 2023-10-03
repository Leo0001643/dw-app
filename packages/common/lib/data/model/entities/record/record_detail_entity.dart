import '../../../../utils/formatter.dart';

class RecordDetailData {
  int? statusCode;
  int? code;
  int? total;
  List<DetailBets>? items;

  RecordDetailData({this.statusCode, this.code, this.items, this.total});

  RecordDetailData.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = statusCode;
    total = json['total'];
    if (json['items'] != null) {
      items = <DetailBets>[];
      json['items'].forEach((v) {
        items!.add(new DetailBets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['code'] = this.code;
    data['total'] = total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class DetailBets {
  int? id;
  int? bet_time;
  String? bet_id;
  String? agent_name;
  String? user_name;
  int? bet_state; //注单状态 1-未结算 2-已结算 3-撤单 4-其他
  String? betSum;
  String? betValid;
  String? betWin;
  String? bet_position;
  String? subName; //游戏名称
  String? game_name; //游戏名称
  int? win_state; //我司的注单输赢状态以纯赢为标准1：赢 2：输 3：和(纯赢0、撤单)
  String? game_logo;
  DetailBets(
      {this.id,
      this.bet_id,
      this.bet_time,
      this.agent_name,
      this.bet_state,
      this.betSum,
      this.betValid,
      this.betWin,
      this.bet_position,
      this.user_name,
      this.subName,
      this.game_name,
      this.win_state,
      this.game_logo});

  DetailBets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bet_id = json['bet_id'];
    bet_time = json['bet_time'];
    agent_name = json['agent_name'];
    bet_state = json['bet_state'];
    betSum = json['bet_sum'].toString();
    betValid = json['bet_valid'].toString();
    betWin = json['bet_win'].toString();
    bet_position = json['bet_position'];
    user_name = json['user_name'];
    subName = json['sub_name'];
    game_name = json['game_name'];
    win_state = json['win_state'];
    game_logo = json['game_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bet_id'] = this.bet_id;
    data['bet_time'] = this.bet_time;
    data['agent_name'] = this.agent_name;
    data['bet_state'] = this.bet_state;
    data['bet_sum'] = this.betSum;
    data['bet_valid'] = this.betValid;
    data['bet_win'] = this.betWin;
    data['bet_position'] = this.bet_position;
    data['user_name'] = this.user_name;
    data['sub_name'] = subName;
    data['game_name'] = game_name;
    data['win_state'] = win_state;
    data['game_logo'] = game_logo;
    return data;
  }

  ///保留2位数
  get betSum2FixString {
    return to2fixNumber(betSum);
  }

  get betValid2FixString {
    return to2fixNumber(betValid);
  }

  get betWin2FixString {
    return to2fixNumber(betWin);
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

  ///是否有效投注
  bool get isHasBet {
    if (betSum == null || betSum!.isEmpty) return false;
    double betSumDouble = double.tryParse(betSum!) ?? 0;
    return betSumDouble > 0;
  }
}
